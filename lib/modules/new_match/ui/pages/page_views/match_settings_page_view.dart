import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/controllers/match_settings_controller.dart';
import 'package:team_draw/modules/new_match/ui/components/match_duration_time_component.dart';
import 'package:team_draw/modules/new_match/ui/components/select_box_component.dart';
import 'package:team_draw/modules/new_match/ui/components/select_one_option_component.dart';
import 'package:team_draw/shared/helper/list_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/tittle_component.dart';

class MatchSettingsPageView extends StatefulWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;
  final Function(bool) onShowForwardButton;

  const MatchSettingsPageView(
      {super.key,
      required this.selectedPlayers,
      required this.matchSettings,
      required this.onShowForwardButton});

  @override
  State<MatchSettingsPageView> createState() => _MatchSettingsPageViewState();
}

class _MatchSettingsPageViewState extends State<MatchSettingsPageView> {
  final _controller = Modular.get<MatchSettingsController>();

  @override
  void initState() {
    super.initState();
    final int totalPlayers =
    _controller.getTotalPlayers(widget.selectedPlayers.values);
    if (widget.matchSettings.isAllFieldsValidated()) {
      widget.matchSettings.validateAndSetNumberOfPlayersByTeam(totalPlayers);
      _controller.save(widget.matchSettings);
      widget.onShowForwardButton(true);
    } else {
      widget.matchSettings.setDefaultFields(totalPlayers);
      widget.onShowForwardButton(false);
    }
    _controller.init(widget.selectedPlayers.values, widget.matchSettings);
  }

  Future<void> _verifyCanShowForwardButton() async {
    if (widget.matchSettings.isAllFieldsValidated()) {
      widget.onShowForwardButton(true);
      _controller.save(widget.matchSettings);
    } else {
      widget.onShowForwardButton(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: TittleComponent(tittle: matchSettings),
          ),
          MatchDurationTimeComponent(
            durationHr: widget.matchSettings.durationHr,
            durationMin: widget.matchSettings.durationMin,
            onDurationHrChange: (value) async {
              widget.matchSettings.durationHr = int.parse(value);
              await _verifyCanShowForwardButton();
            },
            onDurationMinChange: (value) =>
                widget.matchSettings.durationMin = int.parse(value),
          ),
          const Divider(),
          SelectBoxComponent(
            value: widget.matchSettings.numberOfTeams.toString(),
            onValueChange: (value) async {
              if (int.parse(value) != widget.matchSettings.numberOfTeams) {
                widget.matchSettings.numberOfTeams = int.parse(value);
                widget.matchSettings.numberOfStartingPlayers = int.parse(_controller.getListOfTotalPlayersPossibleByTeam(
                    widget.matchSettings.numberOfTeams,
                    widget.selectedPlayers.values).last);
                _controller.numberOfStartingPlayers = widget.matchSettings.numberOfStartingPlayers;
                await _verifyCanShowForwardButton();
              }
            },
            values: ListHelper.getListOfPossibleTeams(
                _controller.getTotalPlayers(widget.selectedPlayers.values)),
            description: numberOfTeams,
            labelText: quantity,
          ),
          const Divider(),
          Observer(
            builder: (_) => SelectBoxComponent(
              value: _controller.numberOfStartingPlayers?.toString(),
              onValueChange: (value) async {
                _controller.numberOfStartingPlayers = int.parse(value);
                widget.matchSettings.numberOfStartingPlayers = int.parse(value);
                await _verifyCanShowForwardButton();
              },
              values: _controller.getListOfTotalPlayersPossibleByTeam(
                  widget.matchSettings.numberOfTeams,
                  widget.selectedPlayers.values),
              description: numberOfPlayersByTeam,
              labelText: quantity,
            ),
          ),
          const Divider(),
          Observer(
            builder: (_) => SelectOneOptionComponent(
                question: hasChangeSideQuestion,
                value: _controller.hasChangeSide,
                onValueSelected: (value) async {
                  _controller.changeSide(value);
                  widget.matchSettings.hasChangeSide = value;
                  await _verifyCanShowForwardButton();
                }),
          ),
          const Divider(),
          SelectBoxComponent(
            value: widget.matchSettings.timeToChangePlayer.toString(),
            onValueChange: (value) async {
              widget.matchSettings.timeToChangePlayer = int.parse(value);
              await _verifyCanShowForwardButton();
            },
            values: ListHelper.getListOfMinutes(),
            description: changePlayerEvery,
            labelText: minute,
          ),
          const Divider(),
          Column(
            children: [Text("")],
          )
        ],
      ),
    );
  }
}
