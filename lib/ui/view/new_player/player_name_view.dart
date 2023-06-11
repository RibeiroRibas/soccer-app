import 'package:flutter/material.dart';
import 'package:team_draw/ui/component/elevated_button_component.dart';
import 'package:team_draw/ui/component/outlined_text_field_component.dart';
import 'package:team_draw/ui/layout/default_page_layout.dart';

import '../../section/question_section.dart';
import '../../../shared/i18n/messages.dart';

class PlayerNamePage extends StatelessWidget {
  const PlayerNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPageLayout(
        tittle: newPLayer,
        body: const Padding(
          padding: EdgeInsets.only(top: 64.0),
          child: Column(
            children: [
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
