import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/outlined_text_field_component.dart';
import 'package:team_draw/shared/ui/component/question_component.dart';

class PlayerNamePage extends StatelessWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;
  final List<Player>? allPlayers;

  PlayerNamePage({
    super.key,
    required this.player,
    required this.goToNextPageView,
    required this.allPlayers,
  });

  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  bool _existPlayerName(String name) {
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
        const QuestionComponent(
          questionText: whatIsPlayerName,
          subQuestionText: orNickname,
        ),
        Form(
          key: _formKey,
          child: OutlinedTextFieldComponent(
            focusNode: _focusNode,
            validator: (String? value) => value == null || value.isEmpty
                ? requestTeamName
                : _existPlayerName(value)
                    ? playerAlreadyExist
                    : null,
            labelText: name,
            initialValue: player.name ?? "",
            onChanged: (String value) {
              player.name = value;
              if (player.id == 0) {
                _formKey.currentState!.validate();
              }
            },
            onFieldSubmitted: (_) {
              if (player.id == 0) {
                _formKey.currentState!.validate()
                    ? goToNextPageView(NewPlayerPageView.principalPosition)
                    : null;
              } else {
                goToNextPageView(NewPlayerPageView.principalPosition);
              }
            },
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
