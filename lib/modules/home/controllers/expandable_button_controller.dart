import 'package:mobx/mobx.dart';

part 'expandable_button_controller.g.dart';

class ExpandableButtonController = ExpandableButtonControllerBase
    with _$ExpandableButtonController;

abstract class ExpandableButtonControllerBase with Store {
  @observable
  bool isButtonOpen = false;

  @action
  void changeButtonState() {
    isButtonOpen = !isButtonOpen;
  }
}
