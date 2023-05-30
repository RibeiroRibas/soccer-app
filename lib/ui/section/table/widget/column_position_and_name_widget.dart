import 'package:flutter/material.dart';

class ColumnPositionAndNameWidget extends StatelessWidget {
  final List<String> teamNameTableValues;

  const ColumnPositionAndNameWidget({
    Key? key,
    required this.teamNameTableValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int numberOfColumns = 7;
    Color lineColorTable = Colors.white12;

    double calculateCellWidth() =>
        (_getScreenWidthHalf(context)) / numberOfColumns;

    Color getTableCellColor({bool changeColor = true}) {
      if (changeColor) {
        lineColorTable =
            lineColorTable == Colors.white12 ? Colors.white24 : Colors.white12;
      }
      return lineColorTable;
    }

    return Column(
      children: [
        for (int index = 0; index < teamNameTableValues.length; index++) ...[
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: calculateCellWidth(),
                height: 25,
                color: getTableCellColor(),
                child: Text(index == 0 ? "" : index.toString()),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: _calculateCellWidth(context),
                height: 25,
                color: getTableCellColor(changeColor: false),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    teamNameTableValues.elementAt(index),
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          )
        ]
      ],
    );
  }

  double _calculateCellWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / 2.9;

  double _getScreenWidthHalf(BuildContext context) =>
      MediaQuery.of(context).size.width / 2.0;
}
