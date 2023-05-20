import 'package:flutter/cupertino.dart';
import 'package:team_draw/shared/sections/team_versus/player_position_widget.dart';

import '../../../models/player.dart';
import '../../themes/green_theme.dart';
import '../../themes/theme_colors.dart';

class PositionsAndOverallWidget extends StatefulWidget {
  const PositionsAndOverallWidget({Key? key, required this.player}) : super(key: key);
  final Player player;

  @override
  State<PositionsAndOverallWidget> createState() => _PositionsAndOverallWidgetState();
}

class _PositionsAndOverallWidgetState extends State<PositionsAndOverallWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PlayerPositionWidget(
          position: widget.player.principalPosition,
          positionColor: ThemeColors.principalPosition,
        ),
        PlayerPositionWidget(
          position: widget.player.secondaryPosition,
          positionColor: ThemeColors.white,
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
    );
  }
}