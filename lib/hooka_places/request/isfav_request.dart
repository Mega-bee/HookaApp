class IsFavorite {

  bool  isFav;

  IsFavorite({required this.isFav});

  Map<String, dynamic> toJson() {
    return {
      'IsFavorite': isFav,
    };
  }

}