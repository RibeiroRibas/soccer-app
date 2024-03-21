import 'package:mobx/mobx.dart';

part 'new_match_view_model.g.dart';

class NewMatchViewModel = NewMatchViewModelBase with _$NewMatchViewModel;

abstract class NewMatchViewModelBase with Store {
  @observable
  int currentView = 0;

  @action
  void changeCurrentView(int index) {
    if (index == -1) {
      currentView = currentView - 1;
    } else {
      currentView++;
    }
  }
}
