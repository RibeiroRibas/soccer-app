import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/outlined_text_field_component.dart';
import 'package:team_draw/shared/view/section/question_section.dart';

class PlayerNameView extends StatelessWidget {
  final Player player;
  final void Function(int) onActionPress;
  final List<Player>? allPlayers;

  PlayerNameView({
    super.key,
    required this.player,
    required this.onActionPress,
    required this.allPlayers,
  });

  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  bool existPlayerName(String name) {
    return allPlayers!.any((player) {
      String playerName = name;
      return player.name!.toLowerCase() ==
          playerName.trimLeft().trimRight().toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuestionSection(
          questionText: whatIsPlayerName,
          subQuestionText: orNickname,
        ),
        Form(
          key: _formKey,
          child: OutlinedTextFieldComponent(
            focusNode: _focusNode,
            validator: (String? value) => value == null || value.isEmpty
                ? requestTeamName
                : existPlayerName(value)
                    ? playerAlreadyExist
                    : null,
            labelText: name,
            initialValue: player.name ?? "",
            onChanged: (String value) {
              player.name = value;
              _formKey.currentState!.validate();
            },
            onFieldSubmitted: (_) =>
                _formKey.currentState!.validate() ? onActionPress(1) : null,
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
