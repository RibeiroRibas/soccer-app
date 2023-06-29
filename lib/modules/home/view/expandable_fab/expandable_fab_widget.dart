import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/modules/home/view/expandable_fab/expandable_action_button_widget.dart';
import 'package:team_draw/modules/home/view/expandable_fab/tap_to_close_fab_widget.dart';
import 'package:team_draw/modules/home/view/expandable_fab/tap_to_open_fab_widget.dart';
import 'package:team_draw/modules/home/view_model/expandable_button_controller.dart';

@immutable
class ExpandableFabWidget extends StatefulWidget {
  const ExpandableFabWidget({
    super.key,
    required this.distance,
    required this.children,
  });

  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFabWidget> createState() => _ExpandableFabWidgetState();
}

class _ExpandableFabWidgetState extends State<ExpandableFabWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  final ExpandableButtonController expandableButtonController =
      Modular.get<ExpandableButtonController>();

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
      if (expandableButtonController.isButtonOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
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
          TapToCloseFabWidget(
              onTapButton: () =>
                  expandableButtonController.changeButtonState()),
          for (var i = 0, angleInDegrees = 0.0;
              i < count;
              i++, angleInDegrees += step) ...{
            ExpandingActionButtonWidget(
              directionInDegrees: angleInDegrees,
              maxDistance: widget.distance,
              progress: _expandAnimation,
              child: widget.children[i],
            ),
          },
          Observer(
            builder: (_) => TapToOpenFabWidget(
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
