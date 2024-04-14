import 'package:flutter/material.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';

class QuestionSection extends StatelessWidget {
  final String questionText;
  final String subQuestionText;

  const QuestionSection({
    super.key,
    required this.questionText,
    required this.subQuestionText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          TextWithBorderComponent(
            text: questionText,
            textStyle: Theme.of(context).textTheme.bodyLarge!,
          ),
          Text(
            "($subQuestionText)",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
