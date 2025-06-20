import 'package:lab_2/favorite/model/favorite_model.dart';

class FavoriteController {
  FavoriteModel favoriteModel = FavoriteModel();

  togglefavoriteSt(id) => favoriteModel.togglefavoriteSt(id);
  isFavorite(id) => favoriteModel.isFavorite(id);
  List<dynamic> get favoriteItems => favoriteModel.product;
}
