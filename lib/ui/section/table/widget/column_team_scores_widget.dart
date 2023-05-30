import 'package:flutter/material.dart';

class ColumnTeamScoresWidget extends StatelessWidget {
  final List<List<String>> teamScoreTableValues;

  const ColumnTeamScoresWidget({
    Key? key,
    required this.teamScoreTableValues,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    const int numberOfColumns = 7;
    Color tableCellColor = Colors.white12;

    double calculateCellWidth(BuildContext context) =>
        (_getScreenWidthHalf(context)) / numberOfColumns;

    Color getTableCellColor() =>
        tableCellColor == Colors.white12 ? Colors.white24 : Colors.white12;

    return SizedBox(
      width: _getScreenWidthHalf(context),
      child: Column(
        children: [
          for (List<String> values in teamScoreTableValues) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (String value in values) ...[
                  Container(
                    alignment: Alignment.center,
                    width: calculateCellWidth(context),
                    height: 25,
                    color: getTableCellColor(),
                    child: Text(
                      value,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ],
            ),
          ]
        ],
      ),
    );
  }

  double _getScreenWidthHalf(BuildContext context) =>
      MediaQuery.of(context).size.width / 2.0;
  
}
