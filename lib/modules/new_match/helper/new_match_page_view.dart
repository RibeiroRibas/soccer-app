enum NewMatchPageView {
  playersLineup(0),
  dejaVuMatch(1),
  matchSettingsView(2),
  drawnTeamsView(3),
  finish(3);

  final int pageIndex;

  const NewMatchPageView(this.pageIndex);

  static int getTotalPages() => NewMatchPageView.values.length - 1;
}
