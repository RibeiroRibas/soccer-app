import 'package:flutter/material.dart';
import 'package:team_draw/ui/section/question_section.dart';

class PlayerPositionView extends StatelessWidget {
  final String questionText;
  final String subQuestionText;
  final List<Widget> positions;

  const PlayerPositionView(
      {super.key,
      required this.questionText,
      required this.subQuestionText,
      required this.positions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionSection(
          questionText: questionText,
          subQuestionText: subQuestionText,
        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.5,
            ),
            children: positions,
          ),
        ),
      ],
    );
  }
}
