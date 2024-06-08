import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/ui/components/match_duration_time_component.dart';
import 'package:team_draw/modules/new_match/ui/components/select_box_component.dart';
import 'package:team_draw/modules/new_match/controllers/match_settings_controller.dart';
import 'package:team_draw/modules/new_match/ui/components/select_one_option_component.dart';
import 'package:team_draw/shared/helper/list_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/tittle_component.dart';

class MatchSettingsView extends StatefulWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;

  const MatchSettingsView(
      {super.key, required this.selectedPlayers, required this.matchSettings});

  @override
  State<MatchSettingsView> createState() => _MatchSettingsViewState();
}

class _MatchSettingsViewState extends State<MatchSettingsView> {
  final _controller = Modular.get<MatchSettingsController>();
  late ReactionDisposer _disposerNumberOfTeams;

  @override
  void initState() {
    super.initState();
    _controller.init(widget.selectedPlayers.values, widget.matchSettings);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposerNumberOfTeams = autorun((_) {
      widget.matchSettings.numberOfTeams = _controller.numberOfTeams;
      widget.matchSettings.numberOfStartingPlayers =
          _controller.numberOfPlayersByTeam;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: TittleComponent(tittle: matchSettings),
            ),
            MatchDurationTimeComponent(
              durationHr: widget.matchSettings.durationHr,
              durationMin: widget.matchSettings.durationMin,
              onDurationHrChange: (value) =>
                  widget.matchSettings.durationHr = value,
              onDurationMinChange: (value) =>
                  widget.matchSettings.durationMin = value,
            ),
            const Divider(),
            SelectBoxComponent(
              value: _controller.numberOfTeams,
              onValueChange: (value) {
                _controller.changeNumberOfTeams(value);
              },
              values: ListHelper.getListOfPossibleTeams(
                  _controller.getTotalPlayers()),
              description: numberOfTeams,
              labelText: quantity,
            ),
            const Divider(),
            SelectBoxComponent(
              value: _controller.numberOfPlayersByTeam,
              onValueChange: (value) =>
                  widget.matchSettings.numberOfStartingPlayers = value,
              values: ListHelper.getListOfTotalPlayersPossibleByTeam(
                  _controller.numberOfPlayersByTeam),
              description: numberOfPlayersByTeam,
              labelText: quantity,
            ),
            const Divider(),
            SelectOneOptionComponent(
                question: hasChangeSideQuestion,
                value: _controller.hasChangeSide!,
                onValueSelected: (value) {
                  _controller.changeSide(value);
                  widget.matchSettings.hasChangeSide = value;
                }),
            const Divider(),
            SelectBoxComponent(
              value: widget.matchSettings.timeToChangePlayer,
              onValueChange: (value) =>
                  widget.matchSettings.timeToChangePlayer = value,
              values: ListHelper.getListOfMinutes(),
              description: changePlayerEvery,
              labelText: minute,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _disposerNumberOfTeams();
  }
}
