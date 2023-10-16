import 'package:flutter/cupertino.dart';

import 'food.dart';

class shop extends ChangeNotifier {
  //Menu
  final List<Food> _Menu = [
    Food(
        price: 1200,
        name: "Beef",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: 1200,
        name: "Chicken",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: 1200,
        name: "Goat",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: 1200,
        name: "Fish",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
  ];

  //Popular items
  final List<Food> _popular_items = [
    Food(
        price: 1200,
        name: "Beef",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: 2000,
        name: "Chicken",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: 1500,
        name: "Goat",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
    Food(
        price: 1400,
        name: "Fish",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
  ];

  //Offers
  final List<Food> _todays_Offers = [
    Food(
        price: 1200,
        name: "Two for one special",
        imagepath: "lib/images/burger 3.png",
        rating: "5"),
    Food(
        price: 2000,
        name: "Ugandan matooke",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
  ];

  // Customer cart
  final List<Food> _cart = [];

  //getter method
  List<Food> get Menu => _Menu;

  List<Food> get cart => _cart;

  List<Food> get popular_items => _popular_items;

  List<Food> get todays_offer => _todays_Offers;

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

  //Calculate total
  int total() {
    int totalprice = 0;
    for (int i = 0; i < _cart.length; i++) {
      totalprice += _cart[i].price;
    }

    return totalprice;
  }
}
