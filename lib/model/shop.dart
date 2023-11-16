import 'package:STC/model/pets.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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

  List<Food> get found_items => _found_items;

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

  //Search
  List<Food> _found_items = [];
  String searchtext = "";

  updateData() {
    if (searchtext.isEmpty) {
      _found_items = _Menu;
    } else {
      _found_items = _Menu.where((element) =>
              element.name.toLowerCase().contains(searchtext.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  runFilter(String enteredKeyword) {
    searchtext = enteredKeyword;
    updateData();
  }

  //API Test
  static const apiEndpoint =
      "https://jatinderji.github.io/users_pets_api/users_pets.json";

  bool isloading = true;

  String error = "";

  Pets pets = Pets(data: []);

  getDatafromApi() async {
    try {
      Response response = await http.get(Uri.parse(apiEndpoint));
      if (response.statusCode == 200) {
        pets = petsFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }

    isloading = false;

    notifyListeners();
  }
}
