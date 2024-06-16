enum HomePageViewHelper {
  home(0),
  teams(1),
  players(2),
  finish(3);

  final int pageIndex;

  const HomePageViewHelper(this.pageIndex);

  static int getTotalPages() => HomePageViewHelper.values.length - 1;
}
