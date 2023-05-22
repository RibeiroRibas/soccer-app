import 'package:flutter/material.dart';
import 'package:team_draw/shared/components/elevated_button_component.dart';
import 'package:team_draw/shared/components/outlined_text_field_component.dart';
import 'package:team_draw/shared/layout/default_page_layout.dart';

import '../../shared/sections/question_section.dart';
import '../../shared/i18n/messages.dart';

class PlayerNamePage extends StatelessWidget {
  const PlayerNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPageLayout(
        tittle: newPLayer,
        body: Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: Column(
            children: const [
              QuestionSection(
                questionText: whatIsPlayerName,
                subQuestionText: orNickname,
              ),
              OutlinedTextFieldComponent(labelText: name)
            ],
          ),
        ),
        buttonNavigationBar: ElevatedButtonComponent(
          onButtonPressed: () {},
          text: next,
        ));
  }
}
