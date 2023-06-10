import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/ui/section/subtitle/player_overall_subtitle_widget.dart';

class PlayerOverallSubtitleSection extends StatelessWidget {
  const PlayerOverallSubtitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          PlayerOverallSubtitleWidget(
            text: principalPosition,
            color: ThemeColors.principalPosition,
          ),
          PlayerOverallSubtitleWidget(
            text: secondaryPosition,
            color: ThemeColors.secondaryPosition,
          ),
          PlayerOverallSubtitleWidget(
            text: overall,
            color: ThemeColors.primary,
          ),
        ],
      ),
    );
  }
}
