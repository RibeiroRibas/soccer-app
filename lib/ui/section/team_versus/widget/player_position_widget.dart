import 'package:flutter/material.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class PlayerPositionWidget extends StatefulWidget {
  final Position? position;
  final Color positionColor;

  const PlayerPositionWidget({
    Key? key,
    required this.position,
    required this.positionColor,
  }) : super(key: key);

  @override
  State<PlayerPositionWidget> createState() => _PlayerPositionWidgetState();
}

class _PlayerPositionWidgetState extends State<PlayerPositionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 25,
        width: 25,
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
