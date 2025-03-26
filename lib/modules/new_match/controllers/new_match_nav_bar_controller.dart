import 'package:mobx/mobx.dart';

part 'new_match_nav_bar_controller.g.dart';

class NewMatchNavBarController = NewMatchNavBarControllerBase
    with _$NewMatchNavBarController;

abstract class NewMatchNavBarControllerBase with Store {
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
