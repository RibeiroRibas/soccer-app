import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/component/elevated_button_component.dart';
import 'package:team_draw/ui/layout/default_page_layout.dart';
import 'package:team_draw/ui/section/question_section.dart';

import 'star_rating_widget.dart';

class PlayerOverallView extends StatelessWidget {
  final int value;

  const PlayerOverallView({Key? key, this.value = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPageLayout(
        tittle: newPLayer,
        body: Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: Column(
            children: [
              const QuestionSection(
                questionText: playerOverall,
                subQuestionText: fromOneToFive,
              ),
              StarRatingWidget(
                onChanged: (int index) {},
              ),
            ],
          ),
        ),
        buttonNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButtonComponent(
              onButtonPressed: () {},
              text: savePlayer,
            ),
            ElevatedButtonComponent(
              onButtonPressed: () {},
              text: savePlayerAndAddNew,
            ),
          ],
        ));
  }
}
