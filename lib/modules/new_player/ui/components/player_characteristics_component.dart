import 'package:flutter/material.dart';
import 'package:team_draw/shared/ui/component/tittle_with_sub_tittle_component.dart';

class PlayerCharacteristicsComponent extends StatelessWidget {
  final String questionText;
  final String subQuestionText;
  final List<Widget> positions;

  const PlayerCharacteristicsComponent(
      {super.key,
      required this.questionText,
      required this.subQuestionText,
      required this.positions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TittleWithSubTittleComponent(
          tittle: questionText,
          subTittle: subQuestionText,
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
