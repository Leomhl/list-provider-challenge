enum DestinationCategory {
  beaches,
  countrysides,
  historicals,
  mountains,
  orientals,
  occidentals
}

extension DestinationCategoryExtension on DestinationCategory? {

  String get name {
    switch (this) {
      case DestinationCategory.beaches:
        return "Praias";
      case DestinationCategory.countrysides:
        return "Campos";
      case DestinationCategory.historicals:
        return "Históricos";
      case DestinationCategory.mountains:
        return "Montanhas";
      case DestinationCategory.orientals:
        return "Orientais";
      case DestinationCategory.occidentals:
        return "Ocidentais";
      default:
        return '';
    }
  }
}