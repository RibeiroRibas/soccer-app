import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/component/outlined_text_field_component.dart';
import 'package:team_draw/ui/section/question_section.dart';

class PlayerNameView extends StatefulWidget {
  const PlayerNameView({Key? key}) : super(key: key);

  @override
  State<PlayerNameView> createState() => _PlayerNameViewState();
}

class _PlayerNameViewState extends State<PlayerNameView> {
  final PlayerViewModel viewModel = Modular.get<PlayerViewModel>();
  late final List<Player> allPlayers;
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    findAllPlayers();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel.onButtonPressed = () {
      _validateForm(viewModel.player.name ?? "");
    };
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> findAllPlayers() async {
    allPlayers = await viewModel.findAllPlayers();
  }

  bool playerNameAlreadyExist(String name) {
    return allPlayers.any((player) {
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
            validator: (String? value) => value == null || value.isEmpty
                ? requestPlayerName
                : playerNameAlreadyExist(value)
                    ? playerAlreadyExist
                    : null,
            labelText: name,
            playerName: viewModel.player.name ?? "",
            onChanged: (String value) {
              _validateForm(value);
            },
          ),
        )
      ],
    );
  }

  void _validateForm(String value) {
    viewModel.player.name = value;
    if (_formKey.currentState!.validate()) {
      viewModel.canGoToNextView = true;
    } else {
      viewModel.canGoToNextView = false;
    }
  }
}
