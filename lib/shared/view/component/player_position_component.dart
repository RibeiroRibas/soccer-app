import 'package:flutter/material.dart';
import 'package:team_draw/model/position.dart';

class PlayerNameAndPositionComponent extends StatelessWidget {
  final Position? position;
  final Color? positionColor;
  final String? playerName;

  const PlayerNameAndPositionComponent({
    super.key,
    required this.position,
    this.positionColor,
    this.playerName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 25,
          width: 25,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: positionColor == null
                    ? Theme.of(context).primaryColor
                    : position != null
                        ? positionColor!
                        : Colors.transparent,
              )),
          child: position != null
              ? Text(
                  position!.acronym,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: positionColor, fontWeight: FontWeight.bold),
                )
              : null,
        ),
        if (playerName != null)
          Text(
            playerName!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: positionColor, fontWeight: FontWeight.bold),
          )
      ],
    );
  }
}
