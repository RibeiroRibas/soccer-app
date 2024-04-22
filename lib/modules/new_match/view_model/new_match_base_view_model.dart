import 'package:mobx/mobx.dart';

part 'new_match_base_view_model.g.dart';

class NewMatchBaseViewModel = NewMatchBaseViewModelBase
    with _$NewMatchBaseViewModel;

abstract class NewMatchBaseViewModelBase with Store {
  @observable
  bool isShowForwardButton = false;

  @action
  void showForwardButton(bool isShowButton) {
    if (isShowForwardButton && !isShowButton) {
      isShowForwardButton = isShowButton;
      return;
    }
    if (!isShowForwardButton && isShowButton) {
      isShowForwardButton = isShowButton;
    }
  }
}
