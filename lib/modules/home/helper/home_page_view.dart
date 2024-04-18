enum HomePageView {
  home(0),
  teams(1),
  players(2),
  finish(3);

  final int pageIndex;

  const HomePageView(this.pageIndex);

  static int getTotalPages() => HomePageView.values.length - 1;
}
