import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/match/ui/dialog/pre_match_dialog.dart';
import 'package:team_draw/modules/match/ui/dialog/set_player_score_dialog.dart';
import 'package:team_draw/modules/match/ui/modal/teams_and_match_info_modal.dart';
import 'package:team_draw/modules/match/ui/section/match_manager_section.dart';
import 'package:team_draw/modules/match/ui/section/starting_players_section.dart';
import 'package:team_draw/modules/match/ui/section/teams_and_match_info_section.dart';
import 'package:team_draw/modules/match/view_model/match_timer_view_model.dart';
import 'package:team_draw/modules/match/view_model/match_view_model.dart';
import 'package:team_draw/modules/match/view_model/players_one_view_model.dart';
import 'package:team_draw/modules/match/view_model/players_two_view_model.dart';
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
  final matchViewModel = Modular.get<MatchViewModel>();
  final playersOneViewModel = Modular.get<PlayersOneViewModel>();
  final playersTwoViewModel = Modular.get<PlayersTwoViewModel>();
  final matchTimerViewModel = Modular.get<MatchTimerViewModel>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance
        .addPostFrameCallback((_) => _showPreMatchDialog());
    _initViewModels();
    reaction((_) => matchTimerViewModel.isTimeToSwitchPlayer, (_) {
      if (!matchTimerViewModel.isDisableAutomaticSwitch) {
        _switchPlayers();
      }
    });
  }

  void _switchPlayers() {
    playersOneViewModel.switchPlayers();
    playersTwoViewModel.switchPlayers();
  }

  void _initViewModels() {
    matchViewModel.init(widget.matches, widget.matchSettings);
    _setOrientation();
    playersOneViewModel.init(matchViewModel.playersTeamOne,
        matchViewModel.reservePlayersTeamOne, matchViewModel.match.teamOne!);
    playersTwoViewModel.init(matchViewModel.playersTeamTwo,
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

  Future<void> _showSetPlayerScoreDialog(BuildContext context,
      bool isScoreTeamOne, bool isIncreaseScore, List<Player> players) async {
    if (matchViewModel.verifyIfScoreIsNotEqualsZero(
        isScoreTeamOne, isIncreaseScore)) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SetPlayerScoreDialog(
                isIncreaseScore: isIncreaseScore,
                players: players,
                onPlayerTap: (player) => matchViewModel
                    .changeScore(isScoreTeamOne, isIncreaseScore, player,
                        _buildGoalTime())
                    .then((_) => _verifyErrorMessageAndDoDisposeDialog()));
          });
    }
  }

  String _buildGoalTime() {
    return "${matchTimerViewModel.hour.toString().padLeft(2, '0')}:"
        "${matchTimerViewModel.minutes.toString().padLeft(2, '0')}:"
        "${matchTimerViewModel.seconds.toString().padLeft(2, '0')}";
  }

  Future<void> _showSelectedWrongPlayerAlertDialog(String tittle) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: Text(tittle),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                      foregroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.onSecondary)),
                  child: const Text(ok)),
            ],
          );
        });
  }

  _verifyErrorMessageAndDoDisposeDialog() {
    if (matchViewModel.playerGoalNotFundMessage != null) {
      _showSelectedWrongPlayerAlertDialog(
          matchViewModel.playerGoalNotFundMessage!);
    } else {
      Navigator.of(context).pop();
    }
  }

  Future<void> _showPreMatchDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const PreMatchDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Stack(
        children: [
          const _BackGroundField(),
          TeamsAndMatchInfoSection(
              shieldTeamOne: matchViewModel.match.teamOne!.shield!.resourcePath,
              shieldTeamTwo: matchViewModel.match.teamTwo!.shield!.resourcePath,
              onShieldTap: () => _goToTeamsAndMatchInfoModal(context)),
          Observer(
            builder: (_) => StartingPlayersSection(
                isTeamLeftSide: true,
                players: playersOneViewModel.startingPlayers,
                teamColor: matchViewModel.resolveColorTeamOne()),
          ),
          if (!matchViewModel.isMatchStarted)
            Center(
                child: ElevatedButtonComponent(
                    onButtonPressed: () => matchViewModel.startMatch(),
                    text: start)),
          if (matchViewModel.isMatchStarted)
            Observer(
                builder: (_) => MatchManagerSection(
                      scoreTeamOne: matchViewModel.scoreTeamOne,
                      scoreTeamTwo: matchViewModel.scoreTeamTwo,
                      onChangeScore: (isScoreTeamOne, isIncreaseScore) =>
                          _showSetPlayerScoreDialog(
                              context,
                              isScoreTeamOne,
                              isIncreaseScore,
                              isScoreTeamOne
                                  ? matchViewModel.match.teamOne!.players!
                                  : matchViewModel.match.teamTwo!.players!),
                      timeToChangePlayer:
                          matchViewModel.settings.timeToChangePlayer,
                    )),
          Observer(
            builder: (_) => StartingPlayersSection(
                isTeamLeftSide: false,
                players: playersTwoViewModel.startingPlayers,
                teamColor: matchViewModel.resolveColorTeamTwo()),
          ),
        ],
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
