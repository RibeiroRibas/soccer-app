import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/team_match.dart';

part 'match_timer_controller.g.dart';

class MatchTimerController = MatchTimerControllerBase
    with _$MatchTimerController;

abstract class MatchTimerControllerBase with Store implements Disposable {
  @observable
  int hour = 0;

  @observable
  int minutes = 0;

  @observable
  int seconds = 0;

  @observable
  bool isPaused = false;

  @observable
  bool isStopped = false;

  @observable
  int minutesToSwitchPlayer = 0;

  @observable
  int secondsToSwitchPlayer = 0;

  @observable
  bool isTimeToSwitchPlayer = false;

  @observable
  bool isAlmostTimeToSwitchPlayer = false;

  @observable
  bool isDisableAutomaticSwitch = false;

  bool isNotShowingModal = true;

  late MatchSettings matchSettings;

  Timer? _reservePlayerTimer;
  Timer? _matchTimer;

  TeamMatch? match;

  late ReactionDisposer reservePlayerTimerDisposer;
  late ReactionDisposer matchTimerDisposer;

  @action
  void init(TeamMatch match, MatchSettings matchSettings) {
    this.match = match;
    this.matchSettings = matchSettings;
    resetTimer();
  }

  @action
  void minusSeconds() {
    if (minutesToSwitchPlayer == 0 && secondsToSwitchPlayer == 1) {
      isAlmostTimeToSwitchPlayer = true;
    }

    if (minutesToSwitchPlayer == 0 && secondsToSwitchPlayer == 0) {
      isTimeToSwitchPlayer = !isTimeToSwitchPlayer;
      isAlmostTimeToSwitchPlayer = false;
      minutesToSwitchPlayer = matchSettings.timeToChangePlayer! - 1;
      secondsToSwitchPlayer = 59;
    } else {
      if (secondsToSwitchPlayer == 0) {
        secondsToSwitchPlayer = 59;
        minutesToSwitchPlayer--;
      } else {
        secondsToSwitchPlayer--;
      }
    }
  }

  @action
  void resetTimer() {
    minutesToSwitchPlayer = matchSettings.timeToChangePlayer!;
    secondsToSwitchPlayer = 0;
  }

  @action
  void plusSeconds() {
    if (_isMatchTimeEnd()) {
      isStopped = true;
    }

    if (seconds == 59) {
      if (minutes == 59) {
        hour++;
        minutes = 0;
        seconds = 0;
      } else {
        seconds = 0;
        minutes++;
      }
    } else {
      seconds++;
    }
  }

  bool _isMatchTimeEnd() {
    return matchSettings.durationHr == hour &&
        matchSettings.durationMin == minutes &&
        seconds == 0;
  }

  @action
  void startReservePlayerTimer() {
    reservePlayerTimerDisposer = autorun((_) => {
          if (_reservePlayerTimer == null && !isPaused)
            _reservePlayerTimer = Timer.periodic(
                const Duration(seconds: 1), (timer) => minusSeconds()),
          if (isPaused)
            {_reservePlayerTimer!.cancel(), _reservePlayerTimer = null}
        });
  }

  @action
  void startMatchTimer() {
    matchTimerDisposer = autorun((_) => {
          if (_matchTimer == null && !isPaused)
            _matchTimer = Timer.periodic(
                const Duration(seconds: 1), (timer) => plusSeconds()),
          if (isPaused) {_matchTimer!.cancel(), _matchTimer = null}
        });
  }

  @action
  void onDisableAutomaticSwitch() {
    isDisableAutomaticSwitch = !isDisableAutomaticSwitch;
  }

  @override
  void dispose() {
    reservePlayerTimerDisposer();
    matchTimerDisposer();
  }
}
