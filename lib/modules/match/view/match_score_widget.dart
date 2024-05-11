import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class MatchScoreWidget extends StatelessWidget {
  final int scoreTeamOne;
  final int scoreTeamTwo;
  final Function increaseScoreTeamOne;
  final Function increaseScoreTeamTwo;
  final Function decreaseScoreTeamOne;
  final Function decreaseScoreTeamTwo;

  const MatchScoreWidget({
    super.key,
    required this.scoreTeamOne,
    required this.scoreTeamTwo,
    required this.increaseScoreTeamOne,
    required this.increaseScoreTeamTwo,
    required this.decreaseScoreTeamOne,
    required this.decreaseScoreTeamTwo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => increaseScoreTeamOne.call(),
                icon: Icon(
                  Icons.arrow_upward,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                scoreTeamOne.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                onPressed: () => decreaseScoreTeamOne.call(),
                icon: Icon(
                  Icons.arrow_downward,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Text(
            versus,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => increaseScoreTeamTwo.call(),
                icon: Icon(
                  Icons.arrow_upward,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                scoreTeamTwo.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                onPressed: () => decreaseScoreTeamTwo.call(),
                icon: Icon(
                  Icons.arrow_downward,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
