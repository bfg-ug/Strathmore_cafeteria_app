import 'package:flutter/cupertino.dart';

import 'food.dart';

class shop extends ChangeNotifier {
  //Menu
  final List<Food> _Menu = [
    Food(
        price: "1200",
        name: "Beef",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: "1200",
        name: "Chicken",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: "1200",
        name: "Goat",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: "1200",
        name: "Fish",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
  ];

  //Popular items
  final List<Food> _popular_items = [
    Food(
        price: "1200",
        name: "Beef",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: "2000",
        name: "Chicken",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: "1500",
        name: "Goat",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: "1400",
        name: "Fish",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
  ];

  // Customer cart
  List<Food> _cart = [];

  //getter method
  List<Food> get Menu => _Menu;
  List<Food> get cart => _cart;
  List<Food> get popular_items => popular_items;

  //add to cart
  void addtoCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
      notifyListeners();
    }
  }

  // remove from cart
  void removefromCart(Food fooditem) {
    _cart.remove(fooditem);
    notifyListeners();
  }
}
