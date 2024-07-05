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
import 'package:team_draw/modules/match/controllers/players_controller.dart';
import 'package:team_draw/modules/match/match_navigator.dart';
import 'package:team_draw/modules/match/ui/component/match_manager_component.dart';
import 'package:team_draw/modules/match/ui/component/starting_players_component.dart';
import 'package:team_draw/modules/match/ui/component/teams_and_match_info_component.dart';
import 'package:team_draw/modules/match/ui/dialog/end_match_alert_dialog.dart';
import 'package:team_draw/modules/match/ui/dialog/pre_match_dialog.dart';
import 'package:team_draw/modules/match/ui/modal/teams_and_match_info_modal.dart';
import 'package:team_draw/shared/dialogs/select_player_dialog.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
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
  final _playersOneController = Modular.get<PlayersOneController>();
  final _playersTwoController = Modular.get<PlayersTwoController>();
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
    _playersOneController.switchPlayers();
    _playersTwoController.switchPlayers();
  }

  void _initControllers() {
    _matchController.init(widget.matches, widget.matchSettings);
    _playersOneController.init(
        _matchController.playersTeamOne,
        _matchController.reservePlayersTeamOne,
        _matchController.match.teamOne!);
    _playersTwoController.init(
        _matchController.playersTeamTwo,
        _matchController.reservePlayersTeamTwo,
        _matchController.match.teamTwo!);
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
    return "${_matchTimerController.hour.toString().padLeft(2, '0')}:"
        "${_matchTimerController.minutes.toString().padLeft(2, '0')}:"
        "${_matchTimerController.seconds.toString().padLeft(2, '0')}";
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
    return Observer(
      builder: (_) => Stack(
        children: [
          const _BackGroundField(),
          TeamsAndMatchInfoComponent(
              shieldTeamOne:
                  _matchController.match.teamOne!.shield!.resourcePath,
              shieldTeamTwo:
                  _matchController.match.teamTwo!.shield!.resourcePath,
              onShieldTap: () => _goToTeamsAndMatchInfoModal(context)),
          Observer(
            builder: (_) => StartingPlayersComponent(
                isTeamLeftSide: true,
                players: _playersOneController.startingPlayers,
                teamColor: _matchController.resolveColorTeamOne()),
          ),
          if (!_matchController.isMatchStarted)
            Center(
                child: ElevatedButtonComponent(
                    onButtonPressed: () => _matchController.startMatch(),
                    text: start)),
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
            builder: (_) => StartingPlayersComponent(
                isTeamLeftSide: false,
                players: _playersTwoController.startingPlayers,
                teamColor: _matchController.resolveColorTeamTwo()),
          ),
        ],
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
