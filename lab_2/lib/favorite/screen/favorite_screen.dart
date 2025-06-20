import 'package:flutter/material.dart';
import 'package:lab_2/favorite/controller/favorite_controller.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteController favoriteController = FavoriteController();

  void togglefavoriteSt(dynamic product) {
    favoriteController.togglefavoriteSt(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteController.favoriteItems.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> item = favoriteController.favoriteItems[index];
          return ListTile(
            title: Text(
              item['title'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(item['description']),
            trailing: IconButton(
              icon: Icon(
                favoriteController.isFavorite(item)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Color(Colors.red.value),
              ),
              onPressed: () {
                setState(() {
                  togglefavoriteSt(item);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
