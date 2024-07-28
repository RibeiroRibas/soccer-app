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
import 'package:team_draw/modules/match/controllers/match_controller.dart';
import 'package:team_draw/modules/match/controllers/match_timer_controller.dart';
import 'package:team_draw/modules/match/controllers/team_controller.dart';
import 'package:team_draw/modules/match/match_navigator.dart';
import 'package:team_draw/modules/match/model/formation.dart';
import 'package:team_draw/modules/match/ui/component/match_manager_component.dart';
import 'package:team_draw/modules/match/ui/component/show_empty_positions_component.dart';
import 'package:team_draw/modules/match/ui/component/starting_players_component.dart';
import 'package:team_draw/modules/match/ui/component/teams_and_match_info_component.dart';
import 'package:team_draw/modules/match/ui/dialog/end_match_alert_dialog.dart';
import 'package:team_draw/modules/match/ui/dialog/pre_match_dialog.dart';
import 'package:team_draw/modules/match/ui/modal/teams_and_match_info_modal.dart';
import 'package:team_draw/shared/dialogs/select_player_dialog.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/drop_down_button_component.dart';
import 'package:team_draw/shared/ui/component/elevated_button_component.dart';

class MatchPage extends StatefulWidget {
  final List<TeamMatch> matches;
  final MatchSettings matchSettings;

  const MatchPage(
      {super.key, required this.matches, required this.matchSettings});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  final _matchController = Modular.get<MatchController>();
  final _teamOneController = Modular.get<TeamTwoController>();
  final _teamTwoController = Modular.get<TeamOneController>();
  final _matchTimerController = Modular.get<MatchTimerController>();
  final _navigator = Modular.get<MatchNavigator>();
  late ReactionDisposer isTimeToSwitchPlayerDisposer;
  late ReactionDisposer isMatchEndDisposer;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance
        .addPostFrameCallback((_) => _showPreMatchDialog());
    _setOrientation();
    _initControllers();
    _reactionsDisposers();
  }

  void _reactionsDisposers() {
    isTimeToSwitchPlayerDisposer =
        reaction((_) => _matchTimerController.isTimeToSwitchPlayer, (_) {
      if (!_matchTimerController.isDisableAutomaticSwitch) {
        _switchPlayers();
      }
    });
    isMatchEndDisposer =
        reaction((_) => _matchTimerController.isStopped, (bool isMatchStopped) {
      if (isMatchStopped) {
        _showEndMatchDialog();
      }
    });
  }

  Future<void> _showEndMatchDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => EndMatchAlertDialog(
            onContinueTap: () {
              _matchTimerController.isStopped = false;
              _navigator.pop();
            },
            onEndMatchTap: () =>
                _matchController.save(widget.matches).then((_) {
                  _navigator.goTo("$newMatchRote$matchResultRoute", arguments: {
                    "matches": widget.matches,
                    "matchSettings": widget.matchSettings
                  });
                })));
  }

  void _switchPlayers() {
    _teamOneController.switchPlayers();
    _teamTwoController.switchPlayers();
  }

  void _initControllers() {
    _matchController.init(widget.matches, widget.matchSettings);
    _teamOneController.init(_matchController.match.teamOne!,
        widget.matchSettings.numberOfStartingPlayers!);
    _teamTwoController.init(_matchController.match.teamTwo!,
        widget.matchSettings.numberOfStartingPlayers!);
    _matchTimerController.init(_matchController.match, widget.matchSettings);
  }

  Future<void> _setOrientation() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft]);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<dynamic> _goToTeamsAndMatchInfoModal(BuildContext context) {
    return _matchController.calculatePlayerScore().then((_) =>
        showBarModalBottomSheet(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            context: context,
            builder: (context) => SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: TeamsAndMatchInfoModal(
                    teamMatch: _matchController.match,
                    playersScoreTeamOne: _matchController.playersScoreTeamOne,
                    playersScoreTeamTwo: _matchController.playersScoreTeamTwo,
                    teamInformation: _matchController.teamsInformation))));
  }

  Future<void> _showSetPlayerScoreDialog(BuildContext context,
      bool isScoreTeamOne, bool isIncreaseScore, List<Player> players) async {
    if (_matchController.verifyIfScoreIsNotEqualsZero(
        isScoreTeamOne, isIncreaseScore)) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SelectPlayerDialog(
                isIncreaseScore: isIncreaseScore,
                players: players,
                onPlayerTap: (player) => _matchController
                    .changeScore(isScoreTeamOne, isIncreaseScore, player,
                        _buildGoalTime())
                    .then((_) => _verifyErrorMessageOrDoDisposeDialog()));
          });
    }
  }

  String _buildGoalTime() {
    return _matchTimerController.buildGoalTime();
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

  _verifyErrorMessageOrDoDisposeDialog() {
    if (_matchController.playerGoalNotFundMessage != null) {
      _showSelectedWrongPlayerAlertDialog(
          _matchController.playerGoalNotFundMessage!);
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
    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          children: [
            const _BackGroundField(),
            TeamsAndMatchInfoComponent(
                shieldTeamOne:
                    _matchController.match.teamOne!.shield!.resourcePath,
                shieldTeamTwo:
                    _matchController.match.teamTwo!.shield!.resourcePath,
                onShieldTap: () => _goToTeamsAndMatchInfoModal(context)),
            if (_teamOneController.isShowEmptyPositionComponent)
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Observer(
                    builder: (_) => ShowEmptyPositionsComponent(
                          showEmptyPositions:
                              _teamOneController.isShowEmptyPosition,
                          onButtonPressed: () =>
                              _teamOneController.onShowEmptyPosition(),
                        )),
              ),
            if (_teamTwoController.isShowEmptyPositionComponent)
              Positioned(
                bottom: 20.0,
                right: 20.0,
                child: Observer(
                    builder: (_) => ShowEmptyPositionsComponent(
                          showEmptyPositions:
                              _teamTwoController.isShowEmptyPosition,
                          onButtonPressed: () =>
                              _teamTwoController.onShowEmptyPosition(),
                        )),
              ),
            if (!_matchController.isMatchStarted) ...{
              Positioned(
                bottom: 15.0,
                left: MediaQuery.of(context).size.width / 3.5,
                child: DropDownButtonComponent(
                  value: _teamOneController.formation.description,
                  onValueChange: (value) => _teamOneController.changeFormation(
                      Formation.fromString(value),
                      widget.matchSettings.numberOfStartingPlayers!),
                  width: 140,
                  height: 30,
                  values: Formation.allPositionsNames(),
                  labelText: "$formation ",
                ),
              ),
              Positioned(
                bottom: 15.0,
                right: MediaQuery.of(context).size.width / 3.5,
                child: DropDownButtonComponent(
                  value: _teamTwoController.formation.description,
                  onValueChange: (value) => _teamTwoController.changeFormation(
                      Formation.fromString(value),
                      widget.matchSettings.numberOfStartingPlayers!),
                  width: 140,
                  height: 30,
                  values: Formation.allPositionsNames(),
                  labelText: formation,
                ),
              ),
              Center(
                  child: ElevatedButtonComponent(
                      onButtonPressed: () => _matchController.startMatch(),
                      text: start)),
              const Positioned(
                top: 5,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text(
                        "* Caso queira mudar as posições, selecione dois jogadores do mesmo time."),
                    Text(
                        "* Caso queira substituir os jogadores mantenha pressionado sobre o jogador selecionado."),
                  ],
                ),
              )
            },
            Observer(
              builder: (_) => Positioned(
                top: 37,
                bottom: 37,
                child: StartingPlayersComponent(
                  isTeamLeftSide: true,
                  players: _teamOneController.startingPlayers,
                  teamColor: _teamOneController.teamColor,
                  showEmptyPositions: _teamOneController.isShowEmptyPosition,
                  onSelectedPlayers: _teamOneController.switchPlayerPosition,
                  numberOfStartingPlayers:
                      widget.matchSettings.numberOfStartingPlayers!,
                  teamFormation: _teamOneController.teamFormation,
                  selectedPlayer: _teamOneController.selectedPlayer,
                ),
              ),
            ),
            if (_matchController.isMatchStarted)
              Observer(
                  builder: (_) => MatchManagerComponent(
                        scoreTeamOne: _matchController.scoreTeamOne,
                        scoreTeamTwo: _matchController.scoreTeamTwo,
                        onChangeScore: (isScoreTeamOne, isIncreaseScore) =>
                            _showSetPlayerScoreDialog(
                                context,
                                isScoreTeamOne,
                                isIncreaseScore,
                                isScoreTeamOne
                                    ? _matchController.match.teamOne!.players!
                                    : _matchController.match.teamTwo!.players!),
                        timeToChangePlayer:
                            _matchController.settings.timeToChangePlayer!,
                      )),
            Observer(
              builder: (_) => Positioned(
                top: 37,
                bottom: 37,
                right: 4,
                child: StartingPlayersComponent(
                  isTeamLeftSide: false,
                  players: _teamTwoController.startingPlayers,
                  teamColor: _teamTwoController.teamColor,
                  showEmptyPositions: _teamTwoController.isShowEmptyPosition,
                  onSelectedPlayers: _teamTwoController.switchPlayerPosition,
                  numberOfStartingPlayers:
                      widget.matchSettings.numberOfStartingPlayers!,
                  teamFormation: _teamTwoController.teamFormation,
                  selectedPlayer: _teamTwoController.selectedPlayer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    isTimeToSwitchPlayerDisposer();
    isMatchEndDisposer();
    super.dispose();
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
