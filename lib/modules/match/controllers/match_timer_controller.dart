import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:team_draw/model/team_match.dart';

part 'match_timer_controller.g.dart';

class MatchTimerController = MatchTimerControllerBase
    with _$MatchTimerController;

abstract class MatchTimerControllerBase with Store {
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

  int timeToSwitchPlayersInMinutes = 0;

  Timer? _reservePlayerTimer;
  Timer? _matchTimer;

  TeamMatch? match;

  @action
  void init(TeamMatch match, int timeToChangePlayer) {
    this.match = match;
    if (timeToSwitchPlayersInMinutes == 0) {
      timeToSwitchPlayersInMinutes = timeToChangePlayer;
      resetTimer();
    }
  }

  @action
  void minusSeconds() {
    if (minutesToSwitchPlayer == 0 && secondsToSwitchPlayer == 1) {
      isAlmostTimeToSwitchPlayer = true;
    }

    if (minutesToSwitchPlayer == 0 && secondsToSwitchPlayer == 0) {
      isTimeToSwitchPlayer = !isTimeToSwitchPlayer;
      isAlmostTimeToSwitchPlayer = false;
      minutesToSwitchPlayer = timeToSwitchPlayersInMinutes - 1;
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
    minutesToSwitchPlayer = timeToSwitchPlayersInMinutes;
    secondsToSwitchPlayer = 0;
  }

  @action
  void plusSeconds() {
    if (seconds == 59) {
      if (minutes == 59) {
        hour++;
      } else {
        seconds = 0;
        minutes++;
      }
    } else {
      seconds = seconds + 1;
    }
  }

  @action
  void startReservePlayerTimer() {
    autorun((_) => {
          if (_reservePlayerTimer == null && !isPaused)
            _reservePlayerTimer = Timer.periodic(
                const Duration(seconds: 1), (timer) => minusSeconds()),
          if (isPaused)
            {_reservePlayerTimer!.cancel(), _reservePlayerTimer = null}
        });
  }

  @action
  void startMatchTimer() {
    autorun((_) => {
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
}
