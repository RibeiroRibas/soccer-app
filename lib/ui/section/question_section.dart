import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/ui/component/text_with_border_component.dart';

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
          TextWithBorderComponent(
            text: questionText,
            textStyle: greenTheme.textTheme.displayMedium,
          ),
          Text("($subQuestionText)",textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
