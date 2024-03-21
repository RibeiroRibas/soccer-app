import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/new_match/view_model/new_match_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/ui/component/outlined_text_field_component.dart';

class TeamsNameWidget extends StatefulWidget {
  final TeamMatch teamMatch;
  final int teamNumber;
  final Function(String, int) newTeamName;

  const TeamsNameWidget({
    super.key,
    required this.teamMatch,
    required this.teamNumber,
    required this.newTeamName,
  });

  @override
  State<TeamsNameWidget> createState() => _TeamsNameWidgetState();
}

class _TeamsNameWidgetState extends State<TeamsNameWidget> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  final NewMatchViewModel viewModel = Modular.get<NewMatchViewModel>();

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Nome do time"),
          content: Form(
            key: _formKey,
            child: OutlinedTextFieldComponent(
              focusNode: _focusNode,
              autoFocus: false,
              validator: (String? value) =>
                  value == null || value.isEmpty ? requestPlayerName : null,
              // : playerNameAlreadyExist(value)
              // ? playerAlreadyExist
              // : null,
              labelText: name,
              initialValue: widget.teamMatch.teamOne!.name!,
              onChanged: (String value) {
                widget.teamMatch.teamOne!.name = value;
                _formKey.currentState!.validate();
              },
              onFieldSubmitted: null,
              // (_) => _formKey.currentState!.validate()
              // ? widget.newTeamName()
              // : null,
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => openDialog(),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 8),
                child: Image(
                  image: AssetImage(widget.teamMatch.teamOne!.shield ??
                      "assets/images/empty-shield.png"),
                  height: 35,
                ),
              ),
              Text(widget.teamMatch.teamOne!.name ?? "Equipe 1"),
            ],
          ),
        ),
        const Text(versus),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 8),
              child: Image(
                image: AssetImage(widget.teamMatch.teamTwo!.shield ??
                    "assets/images/empty-shield.png"),
                height: 35,
              ),
            ),
            Text(widget.teamMatch.teamTwo!.name ?? "Equipe 2"),
          ],
        ),
      ],
    );
  }
}
