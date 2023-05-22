import 'package:flutter/material.dart';
import 'package:team_draw/models/position.dart';
import 'package:team_draw/shared/themes/theme_colors.dart';

class TeamOverallWidget extends StatefulWidget {
  final Map<Position, double> overallByPosition;

  const TeamOverallWidget({Key? key, required this.overallByPosition}) : super(key: key);

  @override
  State<TeamOverallWidget> createState() => _TeamOverallWidgetState();
}

class _TeamOverallWidgetState extends State<TeamOverallWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Row(
            children: [
              Text(
                widget.overallByPosition
                    .values
                    .elementAt(index)
                    .toStringAsFixed(1),
                style: const TextStyle(fontSize: 10),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7.0, left: 1.0),
                child: Container(
                  height: 15,
                  width: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ThemeColors.white)),
                  child: Text(
                    widget.overallByPosition.keys
                        .elementAt(index)
                        .name,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: widget.overallByPosition.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
