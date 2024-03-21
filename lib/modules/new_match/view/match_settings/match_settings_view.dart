import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/view/match_settings/widget/match_duration_time_widget.dart';
import 'package:team_draw/modules/new_match/view/match_settings/widget/select_box_widget.dart';
import 'package:team_draw/modules/new_match/view_model/match_settings_view_model.dart';
import 'package:team_draw/shared/helper/list_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/ui/section/tittle_section.dart';
import 'widget/select_one_option_widget.dart';

class MatchSettingsView extends StatefulWidget {
  final List<Player> selectedPlayers;
  final MatchSettings matchSettings;

  const MatchSettingsView(
      {super.key, required this.selectedPlayers, required this.matchSettings});

  @override
  State<MatchSettingsView> createState() => _MatchSettingsViewState();
}

class _MatchSettingsViewState extends State<MatchSettingsView> {
  MatchSettingsViewModel viewModel = MatchSettingsViewModel();
  late ReactionDisposer _disposerNumberOfTeams;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposerNumberOfTeams = autorun((_) {
      widget.matchSettings.numberOfTeams = viewModel.numberOfTeams;
      widget.matchSettings.numberOfStartingPlayers =
          viewModel.numberOfPlayersByTeam;
    });
  }

  Future<void> _init() async {
    await viewModel.init(widget.selectedPlayers.values, widget.matchSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: TittleSection(tittle: matchSettings),
            ),
            MatchDurationTimeWidget(
              durationHr: widget.matchSettings.durationHr,
              durationMin: widget.matchSettings.durationMin,
              onDurationHrChange: (value) =>
                  widget.matchSettings.durationHr = value,
              onDurationMinChange: (value) =>
                  widget.matchSettings.durationMin = value,
            ),
            const Divider(color: ThemeColors.division),
            SelectBoxWidget(
              value: viewModel.numberOfTeams,
              onValueChange: (value) {
                viewModel.changeNumberOfTeams(value);
              },
              values: ListHelper.getListOfPossibleTeams(
                  viewModel.getTotalPlayers()),
              description: numberOfTeams,
              labelText: quantity,
            ),
            const Divider(color: ThemeColors.division),
            SelectBoxWidget(
              value: viewModel.numberOfPlayersByTeam,
              onValueChange: (value) =>
                  widget.matchSettings.numberOfStartingPlayers = value,
              values: ListHelper.getListOfTotalPlayersPossibleByTeam(
                  viewModel.numberOfPlayersByTeam),
              description: numberOfPlayersByTeam,
              labelText: quantity,
            ),
            const Divider(color: ThemeColors.division),
            Observer(
              builder: (_) => SelectOneOptionWidget(
                  question: hasChangeSideQuestion,
                  value: viewModel.hasChangeSide!,
                  onValueSelected: (value) {
                    viewModel.changeSide(value);
                    widget.matchSettings.hasChangeSide = value;
                  }),
            ),
            const Divider(color: ThemeColors.division),
            SelectBoxWidget(
              value: widget.matchSettings.timeToChangePlayer,
              onValueChange: (value) =>
                  widget.matchSettings.timeToChangePlayer = value,
              values: ListHelper.getListOfMinutes(),
              description: changePlayerEvery,
              labelText: minute,
            ),
            const Divider(color: ThemeColors.division),
            Observer(
              builder: (_) => SelectOneOptionWidget(
                  question: newTeamsQuestion,
                  value: viewModel.isDrawNewTeams!,
                  onValueSelected: (value) {
                    viewModel.drawNewTeams(value);
                    widget.matchSettings.isDrawNewTeams = value;
                  }),
            ),
            const Text(newTeamsSubTittle),
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
