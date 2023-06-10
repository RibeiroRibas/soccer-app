import 'package:flutter/material.dart';

class PlayerScoreWidget extends StatelessWidget {
  final String score;

  const PlayerScoreWidget({Key? key, required this.score}) : super(key: key);

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
