import 'package:flutter/material.dart';
import 'package:team_draw/presentation/custom_icons.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class PlayerScoreSubtitleWidget extends StatefulWidget {
  const PlayerScoreSubtitleWidget({Key? key}) : super(key: key);

  @override
  State<PlayerScoreSubtitleWidget> createState() => _PlayerScoreSubtitleWidgetState();
}

class _PlayerScoreSubtitleWidgetState extends State<PlayerScoreSubtitleWidget> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => tapped = !tapped),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          tapped
              ? const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(Icons.keyboard_arrow_right, size: 20),
                )
              : const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.keyboard_arrow_left, size: 20),
                ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(CustomIcons.soccerBall, size: 20),
          ),
          if (tapped) const Text(goals),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(CustomIcons.victory, size: 20),
          ),
          if (tapped) const Text(victories),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(CustomIcons.defeat, size: 20),
          ),
          if (tapped) const Text(defeats),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(CustomIcons.draw, size: 20),
          ),
          if (tapped) const Text(draws),
        ],
      ),
    );
  }
}
