import 'package:flutter/material.dart';
import 'package:team_draw/shared/components/text_with_border_component.dart';

class QuestionSection extends StatelessWidget {
  final String questionText;
  final String subQuestionText;

  const QuestionSection({
    Key? key,
    required this.questionText,
    required this.subQuestionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          TextWithBorderComponent(text: questionText),
          Text("($subQuestionText)"),
        ],
      ),
    );
  }
}