import 'package:mobx/mobx.dart';

part 'new_match_view_model.g.dart';

class NewMatchViewModel = NewMatchViewModelBase with _$NewMatchViewModel;

abstract class NewMatchViewModelBase with Store {
  @observable
  int currentPageIndex = 0;

  @action
  void changeCurrentPageIndex(int index) {
    if (index == -1) {
      currentPageIndex = currentPageIndex - 1;
    } else {
      currentPageIndex++;
    }
  }
}
