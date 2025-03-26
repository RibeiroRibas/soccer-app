import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'page_view_controller.g.dart';

class PageViewController = PageViewControllerBase with _$PageViewController;

abstract class PageViewControllerBase with Store {
  final PageController pageController;

  PageViewControllerBase(this.pageController);

  @observable
  int currentPageIndex = 0;

  @action
  void changeCurrentPageIndex(int index) {
    currentPageIndex = index;
  }

  @action
  void animateToPage(int pageIndex) {
    currentPageIndex = pageIndex;
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @action
  void animateToNextPage() {
    currentPageIndex = getPageIndex() + 1;
    pageController.animateToPage(
      getPageIndex() + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @action
  void previousPage() {
    currentPageIndex = getPageIndex() - 1;
    pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  bool isFirstPage() {
    return pageController.page == 0;
  }

  int getPageIndex() {
    return pageController.page!.round();
  }
}
