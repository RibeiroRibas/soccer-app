import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/ui/section/subtitle/subtitle_widget.dart';

class SubtitleSection extends StatelessWidget {
  const SubtitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            SubtitleWidget(
              text: principalPosition,
              color: ThemeColors.principalPosition,
            ),
            SubtitleWidget(
              text: secondaryPosition,
              color: ThemeColors.secondaryPosition,
            ),
            SubtitleWidget(
              text: overall,
              color: ThemeColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
