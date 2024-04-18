import 'package:flutter/material.dart';
import 'package:team_draw/shared/view/section/question_section.dart';

class PlayerCharacteristicsView extends StatelessWidget {
  final String questionText;
  final String subQuestionText;
  final List<Widget> positions;

  const PlayerCharacteristicsView(
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
