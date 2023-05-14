import 'package:flutter/material.dart';
import 'package:team_draw/models/position.dart';
import 'package:team_draw/themes/green_theme.dart';

class PlayerPosition extends StatefulWidget {
  final Position? position;
  final Color positionColor;

  const PlayerPosition({
    Key? key,
    required this.position,
    required this.positionColor,
  }) : super(key: key);

  @override
  State<PlayerPosition> createState() => _PlayerPositionState();
}

class _PlayerPositionState extends State<PlayerPosition> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 15,
        width: 15,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: widget.position != null
                  ? widget.positionColor
                  : greenTheme.cardColor,
            )),
        child: widget.position != null
            ? Text(
          widget.position!.name,
          style: TextStyle(
            fontSize: 12,
            color: widget.positionColor,
          ),
        )
            : null,
      ),
    );
  }
}
