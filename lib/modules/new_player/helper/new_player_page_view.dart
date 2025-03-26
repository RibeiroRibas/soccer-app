enum NewPlayerPageView {
  name(0),
  principalPosition(1),
  overall(2),
  confirmNewPlayer(3),
  finish(4);

  final int pageIndex;

  const NewPlayerPageView(this.pageIndex);

  static int getTotalPages() => NewPlayerPageView.values.length - 1;
}
