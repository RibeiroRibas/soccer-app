import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class MatchScoreComponent extends StatelessWidget {
  final int scoreTeamOne;
  final int scoreTeamTwo;
  final Function(bool, bool) onChangeScore;

  const MatchScoreComponent(
      {super.key,
      required this.scoreTeamOne,
      required this.scoreTeamTwo,
      required this.onChangeScore});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ScoreWidget(score: scoreTeamOne, onChangeScore: onChangeScore),
          Text(versus, style: Theme.of(context).textTheme.titleLarge),
          _ScoreWidget(score: scoreTeamTwo, onChangeScore: onChangeScore),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  final int score;
  final Function(bool, bool) onChangeScore;

  const _ScoreWidget({required this.score, required this.onChangeScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () => onChangeScore.call(true, true),
            icon: Icon(Icons.arrow_upward,
                color: Theme.of(context).primaryColor)),
        Text(score.toString(), style: Theme.of(context).textTheme.titleLarge),
        IconButton(
            onPressed: () => onChangeScore.call(true, false),
            icon: Icon(Icons.arrow_downward,
                color: Theme.of(context).primaryColor)),
      ],
    );
  }
}
