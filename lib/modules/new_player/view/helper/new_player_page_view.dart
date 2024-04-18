enum NewPlayerPageView {
  name(0),
  principalPosition(1),
  strengths(2),
  weakPoints(3),
  overall(4),
  confirmNewPlayer(5),
  finish(6);

  final int pageIndex;

  const NewPlayerPageView(this.pageIndex);

  static int getTotalPages() => NewPlayerPageView.values.length - 1;
}
