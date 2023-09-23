import 'package:flutter/material.dart';
import 'package:ujianprojectflutter/frontend/Models/FavoriteModel.dart';
import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  List<Item> _favoriteListPage = [];

  List<Item> get favoriteList => _favoriteListPage;

  void addFavorite(Item todo) {
    _favoriteListPage.add(todo);
    notifyListeners();
  }

  void removeFavorite(Item todo) {
    print(todo);
    _favoriteListPage.remove(todo);
    notifyListeners();
  }
}
