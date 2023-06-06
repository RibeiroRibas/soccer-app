import 'package:flutter/material.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/ui/component/player_position_component.dart';

class TeamOverallByPositionWidget extends StatefulWidget {
  final Map<Position, double> overallByPosition;

  const TeamOverallByPositionWidget({Key? key, required this.overallByPosition})
      : super(key: key);

  @override
  State<TeamOverallByPositionWidget> createState() =>
      _TeamOverallByPositionWidgetState();
}

class _TeamOverallByPositionWidgetState
    extends State<TeamOverallByPositionWidget> {
  late Map<Position, double> sortedOverall = _sortOverall();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding:
                EdgeInsets.only(bottom: 12.0, top: 12.0, left: 6.0, right: 6.0),
            child: Text(
              teamAmount,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
            itemBuilder: (context, index) {
              Color overallColor = _getColorByPosition(
                  widget.overallByPosition.values.elementAt(index));
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        _getOverallByPosition(index),
                        style: TextStyle(fontSize: 12, color: overallColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 20.0),
                        child: PlayerPositionComponent(
                          position:
                              widget.overallByPosition.keys.elementAt(index),
                          positionColor: overallColor,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: widget.overallByPosition.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 2.0),
          ),
        ),
      ],
    );
  }

  String _getOverallByPosition(int index) {
    return widget.overallByPosition.values.elementAt(index).toStringAsFixed(1);
  }

  Color _getColorByPosition(double overall) {
    for (var i = 0; i < sortedOverall.length; i++) {
      double overallElement = sortedOverall.values.elementAt(i);
      if (overall == overallElement && i == 0) {
        return ThemeColors.principalPosition;
      }
      if (overall == overallElement && i == 1) {
        return ThemeColors.secondaryPosition;
      }
    }
    return ThemeColors.white;
  }

  Map<Position, double> _sortOverall() {
    return Map.fromEntries(widget.overallByPosition.entries.toList()
      ..sort((e1, e2) => e2.value.compareTo(e1.value)));
  }
}
