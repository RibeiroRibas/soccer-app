import 'package:flutter/material.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/shared/ui/component/player_position_component.dart';

class TeamOverallByPositionComponent extends StatelessWidget {
  final Map<Position, double> overallByPosition;

  const TeamOverallByPositionComponent(
      {super.key, required this.overallByPosition});

  @override
  Widget build(BuildContext context) {
    Map<Position, double> sortOverall() {
      return Map.fromEntries(overallByPosition.entries.toList()
        ..sort((e1, e2) => e2.value.compareTo(e1.value)));
    }

    late Map<Position, double> sortedOverall = sortOverall();

    String getOverallByPosition(int index) {
      return overallByPosition.values.elementAt(index).toStringAsFixed(1);
    }

    Color getColorByPosition(double overall) {
      for (var i = 0; i < sortedOverall.length; i++) {
        double overallElement = sortedOverall.values.elementAt(i);
        if (overall == overallElement && i == 0) {
          return ThemeColors.principalPosition;
        }
      }
      return ThemeColors.neutralPosition;
    }

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
              Color? overallColor =
                  getColorByPosition(overallByPosition.values.elementAt(index));
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        getOverallByPosition(index),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: overallColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 20.0),
                        child: PlayerNameAndPositionComponent(
                          position: overallByPosition.keys.elementAt(index),
                          positionColor: overallColor,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: overallByPosition.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 2.0),
          ),
        ),
      ],
    );
  }
}
