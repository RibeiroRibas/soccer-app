import 'package:flutter/material.dart';
import 'package:team_draw/model/position.dart';

class PlayerNameAndPositionComponent extends StatelessWidget {
  final Position? position;
  final Color? positionColor;
  final String? playerName;
  final bool isStartingPlayersComponent;
  final bool showEmptyPositions;

  const PlayerNameAndPositionComponent(
      {super.key,
      this.position,
      this.positionColor,
      this.playerName,
      this.isStartingPlayersComponent = false,
      this.showEmptyPositions = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const SizedBox(
          height: 60,
          width: 56,
        ),
        Container(
          height: 28,
          width: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: _resolveColor(context),
              )),
          child: position != null
              ? Text(
                  position!.acronym,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: isStartingPlayersComponent && showEmptyPositions
                          ? positionColor
                          : isStartingPlayersComponent && !showEmptyPositions
                              ? Colors.transparent
                              : positionColor,
                      fontWeight: FontWeight.bold),
                )
              : null,
        ),
        if (playerName != null)
          Positioned(
            bottom: -3,
            child: Text(
              isStartingPlayersComponent ? "" : playerName!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: positionColor, fontWeight: FontWeight.bold),
            ),
          )
      ],
    );
  }

  Color _resolveColor(BuildContext context) {
    return isStartingPlayersComponent && showEmptyPositions
        ? positionColor!
        : isStartingPlayersComponent && !showEmptyPositions
            ? Colors.transparent
            : positionColor == null
                ? Theme.of(context).primaryColor
                : position != null
                    ? positionColor!
                    : Colors.transparent;
  }
}
