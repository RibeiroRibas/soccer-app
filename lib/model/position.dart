enum Position {
  goalkeeper("G"),
  forward("A"),
  midfielder("M"),
  defender("D"),
  leftBack("LE"),
  rightBack("LD");



  const Position(this.name);
  final String name;

  static Position fromIndex(int index){
    switch(index){
      case 0: return goalkeeper;
      case 1: return forward;
      case 2: return midfielder;
      case 3: return defender;
      case 4: return leftBack;
    }
    return rightBack;
  }

}
