import 'package:flutter/material.dart';

class PlayerScoreWidget extends StatelessWidget {
  final String score;

  const PlayerScoreWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 29,
      height: 29,
      alignment: Alignment.center,
      child: Text(score, textAlign: TextAlign.center),
    );
  }
}
