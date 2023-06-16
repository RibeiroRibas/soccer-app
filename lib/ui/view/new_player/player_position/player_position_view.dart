import 'package:flutter/material.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/component/elevated_button_component.dart';
import 'package:team_draw/ui/layout/default_page_layout.dart';
import 'package:team_draw/ui/section/check_box_section.dart';
import 'package:team_draw/ui/section/question_section.dart';

class PlayerPositionView extends StatelessWidget {
  final String questionText;
  final String subQuestionText;

  const PlayerPositionView(
      {Key? key, required this.questionText, required this.subQuestionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> positions = Position.positionNames();
    Position position;

    return DefaultPageLayout(
        tittle: newPLayer,
        body: Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: Column(
            children: [
              QuestionSection(
                questionText: questionText,
                subQuestionText: subQuestionText,
              ),
              SizedBox(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.5,
                  ),
                  children: List.generate(positions.length, (index) {
                    return CheckBoxSection(
                      text: positions[index],
                      isChecked: false,
                      onItemSelected: (_) {
                        position = Position.fromIndex(index);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        buttonNavigationBar: ElevatedButtonComponent(
          onButtonPressed: () {},
          text: next,
        ));
  }
}
