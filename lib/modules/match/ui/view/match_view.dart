import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/match/ui/section/teams_and_match_info_section.dart';
import 'package:team_draw/modules/match/ui/section/match_manager_section.dart';
import 'package:team_draw/modules/match/ui/section/starting_players_section.dart';
import 'package:team_draw/modules/match/ui/modal/teams_and_match_info_modal.dart';
import 'package:team_draw/modules/match/view_model/match_timer_view_model.dart';
import 'package:team_draw/modules/match/view_model/match_view_model.dart';
import 'package:team_draw/modules/match/view_model/reserve_players_one_view_model.dart';
import 'package:team_draw/modules/match/view_model/reserve_players_two_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/elevated_button_component.dart';

class MatchView extends StatefulWidget {
  final List<TeamMatch> matches;
  final MatchSettings matchSettings;

  const MatchView(
      {super.key, required this.matches, required this.matchSettings});

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  final MatchViewModel matchViewModel = Modular.get<MatchViewModel>();
  final ReservePlayerOneViewModel reservePlayerOneViewModel =
      Modular.get<ReservePlayerOneViewModel>();
  final ReservePlayerTwoViewModel reservePlayerTwoViewModel =
      Modular.get<ReservePlayerTwoViewModel>();
  final MatchTimerViewModel matchTimerViewModel =
      Modular.get<MatchTimerViewModel>();

  @override
  void initState() {
    super.initState();
    _initViewModels();
  }

  void _initViewModels() {
    matchViewModel.init(widget.matches, widget.matchSettings);
    _setOrientation();
    reservePlayerOneViewModel.init(matchViewModel.playersTeamOne,
        matchViewModel.reservePlayersTeamOne, matchViewModel.match.teamOne!);
    reservePlayerTwoViewModel.init(matchViewModel.playersTeamTwo,
        matchViewModel.reservePlayersTeamTwo, matchViewModel.match.teamTwo!);
    matchTimerViewModel.init(
        matchViewModel.match, widget.matchSettings.timeToChangePlayer);
  }

  Future<void> _setOrientation() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft]);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<dynamic> _goToTeamsAndMatchInfoModal(BuildContext context) {
    return matchViewModel.calculatePlayerScore().then((_) =>
        showBarModalBottomSheet(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            context: context,
            builder: (context) => SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: TeamsAndMatchInfoModal(
                    teamMatch: matchViewModel.match,
                    playersScoreTeamOne: matchViewModel.playersScoreTeamOne,
                    playersScoreTeamTwo: matchViewModel.playersScoreTeamTwo,
                    teamInformation: matchViewModel.teamsInformation))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => matchViewModel.isMatchStarted
            ? Stack(
                children: [
                  const _BackGroundField(),
                  TeamsAndMatchInfoSection(
                      shieldTeamOne:
                          matchViewModel.match.teamOne!.shield!.resourcePath,
                      shieldTeamTwo:
                          matchViewModel.match.teamTwo!.shield!.resourcePath,
                      onShieldTap: () => _goToTeamsAndMatchInfoModal(context)),
                  StartingPlayersSection(
                      isTeamLeftSide: true,
                      players: matchViewModel.playersTeamOne,
                      teamColor: matchViewModel.resolveColorTeamOne()),
                  Observer(
                      builder: (_) => MatchManagerSection(
                            scoreTeamOne: matchViewModel.scoreTeamOne,
                            scoreTeamTwo: matchViewModel.scoreTeamTwo,
                            onChangeScore: (isScoreTeamOne, isIncreaseScore) =>
                                matchViewModel.changeScore(
                                    isScoreTeamOne, isIncreaseScore),
                            timeToChangePlayer:
                                widget.matchSettings.timeToChangePlayer,
                            match: matchViewModel.match,
                          )),
                  StartingPlayersSection(
                      isTeamLeftSide: false,
                      players: matchViewModel.playersTeamTwo,
                      teamColor: matchViewModel.resolveColorTeamTwo()),
                ],
              )
            : _StartMatchWidget(
                onButtonPressed: () => matchViewModel.startMatch()),
      ),
    );
  }
}

class _BackGroundField extends StatelessWidget {
  const _BackGroundField();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("$imageInitialPath/soccer-field-landscape.jpg"),
                fit: BoxFit.cover)));
  }
}

class _StartMatchWidget extends StatelessWidget {
  final Function onButtonPressed;

  const _StartMatchWidget({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "$imageInitialPath/soccer-field-landscape.jpg"),
                    fit: BoxFit.cover))),
        Center(
            child: ElevatedButtonComponent(
                onButtonPressed: () => onButtonPressed.call(), text: start)),
      ],
    );
  }
}
