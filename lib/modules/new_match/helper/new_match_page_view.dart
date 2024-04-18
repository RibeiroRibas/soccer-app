enum NewMatchPageView {
  playersLineup(0),
  matchSettingsView(1),
  drawnTeamsView(2),
  finish(3);

  final int pageIndex;

  const NewMatchPageView(this.pageIndex);

  static int getTotalPages() => NewMatchPageView.values.length - 1;
}
