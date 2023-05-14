import 'package:flutter/material.dart';
import 'package:team_draw/models/position.dart';
import 'package:team_draw/themes/theme_colors.dart';

class TeamOverallByPosition extends StatefulWidget {
  final Map<Position, double> overallByPosition;

  const TeamOverallByPosition({Key? key, required this.overallByPosition}) : super(key: key);

  @override
  State<TeamOverallByPosition> createState() => _TeamOverallByPositionState();
}

class _TeamOverallByPositionState extends State<TeamOverallByPosition> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                      border: Border.all(color: ThemeColors.secondaryPosition)),
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
