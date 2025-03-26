import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/helper/new_player_page_view.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/outlined_text_field_component.dart';
import 'package:team_draw/shared/ui/component/tittle_with_sub_tittle_component.dart';

class PlayerNamePageView extends StatelessWidget {
  final Player player;
  final void Function(NewPlayerPageView) goToNextPageView;
  final List<Player>? allPlayers;
  final Function(bool) canGoToNextPage;

  PlayerNamePageView({
    super.key,
    required this.player,
    required this.goToNextPageView,
    required this.allPlayers,
    required this.canGoToNextPage,
  });

  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  bool _existPlayerName(String name) {
    return allPlayers!.any((registeredPlayer) {
      String playerName = name;
      return registeredPlayer.name!.toLowerCase() ==
              playerName.trimLeft().trimRight().toLowerCase() &&
          registeredPlayer.id != player.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TittleWithSubTittleComponent(
          tittle: whatIsPlayerName,
          subTittle: orNickname,
        ),
        Form(
          key: _formKey,
          child: OutlinedTextFieldComponent(
            focusNode: _focusNode,
            validator: (String? value) => value == null || value.isEmpty
                ? requestPlayerName
                : _existPlayerName(value)
                    ? playerAlreadyExist
                    : null,
            labelText: name,
            initialValue: player.name ?? "",
            onChanged: (String value) {
              player.name = value;
              bool valid = _formKey.currentState!.validate();
              canGoToNextPage(valid);
            },
            onFieldSubmitted: (_) {
              if (_formKey.currentState!.validate()) {
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
