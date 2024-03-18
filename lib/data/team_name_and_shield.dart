const String _imageInitialPath = "assets/images";

enum TeamNameAndShield {
  barSemLona("Bar sem lona", "$_imageInitialPath/logo-barcelona-256.png"),
  farofasFC('Farofas FC', "$_imageInitialPath/logo-avai-256.png"),
  capivarasFC('Capivaras FC', "$_imageInitialPath/logo-figueirense-256.png"),
  superSaiyajins(
      'Super Saiyajins', "$_imageInitialPath/logo-palmeiras-256.png"),
  pisadinhaFC('Pisadinha FC', "$_imageInitialPath/logo-dortmund-256.png"),
  unidosDaBicuda(
      'Unidos da Bicuda', "$_imageInitialPath/logo-flamengo-256.png");

  final String teamName;
  final String shieldPath;

  const TeamNameAndShield(this.teamName, this.shieldPath);
}
