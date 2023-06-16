import 'package:flutter/material.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class PlayerPositionComponent extends StatefulWidget {
  final Position? position;
  final Color positionColor;

  const PlayerPositionComponent({
    Key? key,
    required this.position,
    required this.positionColor,
  }) : super(key: key);

  @override
  State<PlayerPositionComponent> createState() =>
      _PlayerPositionComponentState();
}

class _PlayerPositionComponentState extends State<PlayerPositionComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              widget.position!.acronym,
              style: TextStyle(
                fontSize: 12,
                color: widget.positionColor,
              ),
            )
          : null,
    );
  }
}
