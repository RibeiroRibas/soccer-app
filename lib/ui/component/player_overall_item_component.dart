import 'package:flutter/cupertino.dart';
import 'package:team_draw/ui/component/player_position_component.dart';

import '../../model/player.dart';
import '../../shared/theme/green_theme.dart';
import '../../shared/theme/theme_colors.dart';

class PlayerOverallItemComponent extends StatefulWidget {
  final Player player;

  const PlayerOverallItemComponent({Key? key, required this.player})
      : super(key: key);

  @override
  State<PlayerOverallItemComponent> createState() =>
      _PlayerOverallItemComponentState();
}

class _PlayerOverallItemComponentState
    extends State<PlayerOverallItemComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.player.name,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: PlayerPositionComponent(
                position: widget.player.principalPosition,
                positionColor: ThemeColors.principalPosition,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: PlayerPositionComponent(
                position: widget.player.secondaryPosition,
                positionColor: ThemeColors.secondaryPosition,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text(
                  widget.player.overall.toInt().toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: greenTheme.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
