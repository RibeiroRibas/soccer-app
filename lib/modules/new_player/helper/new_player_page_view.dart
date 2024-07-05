enum NewPlayerPageView {
  name(0),
  principalPosition(1),
  overall(2),
  strengths(3),
  weakPoints(4),
  confirmNewPlayer(5),
  finish(6);

  final int pageIndex;

  const NewPlayerPageView(this.pageIndex);

  static int getTotalPages() => NewPlayerPageView.values.length - 1;
}
