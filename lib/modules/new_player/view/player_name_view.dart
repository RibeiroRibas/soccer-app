import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/component/outlined_text_field_component.dart';
import 'package:team_draw/ui/section/question_section.dart';

class PlayerNameView extends StatefulWidget {
  final Player player;
  final void Function(int) onActionPress;

  const PlayerNameView(
      {super.key, required this.player, required this.onActionPress});

  @override
  State<PlayerNameView> createState() => _PlayerNameViewState();
}

class _PlayerNameViewState extends State<PlayerNameView> {
  final PlayerViewModel viewModel = Modular.get<PlayerViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _findAllPLayers();
  }

  Future _findAllPLayers() async {
    await viewModel.findAllPlayers();
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
                : viewModel.playerNameAlreadyExist(value)
                    ? playerAlreadyExist
                    : null,
            labelText: name,
            initialValue: widget.player.name ?? "",
            onChanged: (String value) {
              widget.player.name = value;
              _formKey.currentState!.validate();
            },
            onFieldSubmitted: (_) => _formKey.currentState!.validate()
                ? widget.onActionPress(1)
                : null,
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
