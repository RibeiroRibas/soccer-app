import 'package:mobx/mobx.dart';

part 'match_time_view_model.g.dart';

class MatchTimeViewModel = MatchTimeViewModelBase with _$MatchTimeViewModel;

abstract class MatchTimeViewModelBase with Store {
  int timeToChangePlayer = 10;
}
