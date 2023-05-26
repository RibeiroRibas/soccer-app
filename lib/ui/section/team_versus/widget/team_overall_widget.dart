import 'package:flutter/material.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class TeamOverallWidget extends StatefulWidget {
  final Map<Position, double> overallByPosition;
  final double cardWidth;

  const TeamOverallWidget({
    Key? key,
    required this.overallByPosition,
    required this.cardWidth,
  }) : super(key: key);

  @override
  State<TeamOverallWidget> createState() => _TeamOverallWidgetState();
}

class _TeamOverallWidgetState extends State<TeamOverallWidget> {
  late Map<Position, double> sortedOverall = _sortOverall();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemBuilder: (context, index) {
          Color overallColor = _getColorByPosition(
              widget.overallByPosition.values.elementAt(index));
          return Row(
            children: [
              if (index != 0) SizedBox(width: _getSpaceBetweenElements()),
              Text(
                _getOverallByPosition(index),
                style: TextStyle(fontSize: 12, color: overallColor),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: overallColor)),
                  child: Text(
                    widget.overallByPosition.keys.elementAt(index).name,
                    style: TextStyle(fontSize: 14, color: overallColor),
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: widget.overallByPosition.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 2.0),
      ),
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

  double _getSpaceBetweenElements() {
    return widget.cardWidth / (widget.overallByPosition.length * 1.70);
  }

  Map<Position, double> _sortOverall() {
    return Map.fromEntries(widget.overallByPosition.entries.toList()
      ..sort((e1, e2) => e2.value.compareTo(e1.value)));
  }
}
