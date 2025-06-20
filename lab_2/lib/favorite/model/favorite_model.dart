class FavoriteModel {
  List<dynamic> product = [
    {
      "title": "Favorite Item 1",
      "description": "This is the description for favorite item 1.",
      "isFavorite": true,
    },
    {
      "title": "Favorite Item 2",
      "description": "This is the description for favorite item 2.",
      "isFavorite": false,
    },
    {
      "title": "Favorite Item 3",
      "description": "This is the description for favorite item 3.",
      "isFavorite": false,
    },
  ];
  List<dynamic> favoriteItemsList = [];
  void togglefavoriteSt(dynamic product) {
    if (favoriteItemsList.contains(product)) {
      favoriteItemsList.remove(product);
    } else {
      favoriteItemsList.add(product);
    }
  }

  bool isFavorite(dynamic product) {
    return favoriteItemsList.contains(product);
  }
}
