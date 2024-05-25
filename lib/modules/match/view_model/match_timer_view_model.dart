import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:team_draw/model/team_match.dart';

part 'match_timer_view_model.g.dart';

class MatchTimerViewModel = MatchTimerViewModelBase with _$MatchTimerViewModel;

abstract class MatchTimerViewModelBase with Store {
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
  int minutesToChangePlayer = 0;

  @observable
  int secondsToChangePlayer = 0;

  @observable
  bool isTimeToChangePlayer = false;

  @observable
  bool isAlmostTimeToChangePlayer = false;

  int timeToChangeInMinutes = 0;

  Timer? _reservePlayerTimer;
  Timer? _matchTimer;

  TeamMatch? match;

  @action
  void init(TeamMatch match, int timeToChangePlayer) {
    this.match = match;
    if (timeToChangeInMinutes == 0) {
      timeToChangeInMinutes = timeToChangePlayer;
      resetTimer();
    }
  }

  @action
  void minusSeconds() {
    if (minutesToChangePlayer == 1 && secondsToChangePlayer == 0) {
      isAlmostTimeToChangePlayer = true;
    }

    if (minutesToChangePlayer == 0 && secondsToChangePlayer == 0) {
      isTimeToChangePlayer = true;
      minutesToChangePlayer = timeToChangeInMinutes - 1;
      secondsToChangePlayer = 59;
    } else {
      if (secondsToChangePlayer == 0) {
        secondsToChangePlayer = 59;
        minutesToChangePlayer--;
      } else {
        secondsToChangePlayer--;
      }
    }
  }

  @action
  void resetTimer() {
    minutesToChangePlayer = timeToChangeInMinutes;
    secondsToChangePlayer = 0;
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
}
