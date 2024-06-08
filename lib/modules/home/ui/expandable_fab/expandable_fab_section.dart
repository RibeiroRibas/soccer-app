import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/modules/home/controllers//expandable_button_controller.dart';
import 'package:team_draw/modules/home/ui/expandable_fab/expandable_action_button_component.dart';
import 'package:team_draw/modules/home/ui/expandable_fab/tap_to_close_fab_component.dart';
import 'package:team_draw/modules/home/ui/expandable_fab/tap_to_open_fab_component.dart';

@immutable
class ExpandableFabSection extends StatefulWidget {
  const ExpandableFabSection({
    super.key,
    required this.distance,
    required this.children,
  });

  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFabSection> createState() => _ExpandableFabSectionState();
}

class _ExpandableFabSectionState extends State<ExpandableFabSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  final expandableButtonController = Modular.get<ExpandableButtonController>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: expandableButtonController.isButtonOpen ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
    autorun((_) async {
      if (mounted) {
        if (expandableButtonController.isButtonOpen) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          TapToCloseFabComponent(
              onTapButton: () =>
                  expandableButtonController.changeButtonState()),
          for (var i = 0, angleInDegrees = 0.0;
              i < count;
              i++, angleInDegrees += step) ...{
            ExpandingActionComponent(
              directionInDegrees: angleInDegrees,
              maxDistance: widget.distance,
              progress: _expandAnimation,
              child: widget.children[i],
            ),
          },
          Observer(
            builder: (_) => TapToOpenFabComponent(
                isOpen: expandableButtonController.isButtonOpen,
                onTapButton: () =>
                    expandableButtonController.changeButtonState()),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
