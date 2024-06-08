import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class PlayerOverallSubtitleComponent extends StatelessWidget {
  const PlayerOverallSubtitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _PlayerOverallSubtitleWidget(
            text: principalPosition,
            color: ThemeColors.principalPosition,
          ),
          _PlayerOverallSubtitleWidget(
            text: overall,
            color: ThemeColors.overall,
          ),
        ],
      ),
    );
  }
}

class _PlayerOverallSubtitleWidget extends StatelessWidget {
  final String text;
  final Color color;

  const _PlayerOverallSubtitleWidget({
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
