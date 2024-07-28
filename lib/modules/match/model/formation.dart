enum Formation {
  defaultFormation("Padrão"),
  customFormation("Personalizado"),
  byPositionFormation("Por posição");

  final String description;

  const Formation(this.description);

  static List<String> allPositionsNames() {
    return Formation.values.map((value) => value.description).toList();
  }

  static Formation fromString(String formationName) {
    switch (formationName) {
      case "Personalizado":
        return Formation.customFormation;
      case "Por posição":
        return Formation.byPositionFormation;
      default:
        return Formation.defaultFormation;
    }
  }
}
