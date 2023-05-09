import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  List<int> _favoritedItems = [];
  List<int> _numbers = [
    3,
    4,
    6,
    9,
    20,
    30,
    91,
    31,
    84,
    55,
    32,
    99,
    89,
    69,
    71,
    23
  ];
  List<int> get favoritedItems => _favoritedItems;
  List<int> get numbers => _numbers;

  void addItem(int number) {
    _favoritedItems.add(number);
  }

  void removeItem(int number) {
    _favoritedItems.remove(number);
  }
}
