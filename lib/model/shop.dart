import 'package:STC/model/orderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'food.dart';

class shop extends ChangeNotifier {
  //Menu
  final List<Datum> _Menu = [];

  //Popular items
  final List<Datum> _popular_items = [];

  //Offers
  final List<Datum> _todays_Offers = [];

  // Customer cart
  final List<Datum> _cart = [];

  //getter method
  List<Datum> get Menu => _Menu;

  List<Datum> get cart => _cart;

  List<Datum> get popular_items => _popular_items;

  List<Datum> get todays_offer => _todays_Offers;

  //add to cart
  void addtoCart(Datum foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
      notifyListeners();
    }
  }

  // remove from cart
  void removefromCart(Datum fooditem) {
    _cart.remove(fooditem);
    notifyListeners();
  }

  //Calculate total
  int total() {
    int totalprice = 0;
    for (int i = 0; i < _cart.length; i++) {
      // totalprice += _cart[i].price;
    }

    return totalprice;
  }

  //API get products
  Food food = Food(data: []);
  bool isloading = true;
  String error = "";
  Future<void> makeGetRequest() async {
    const token = "33|tu3oYBKxqdyBk8KtgGMSlq9KwGwsZRKs6FZJOSqle5d7896b";
    const url =
        'http://209.38.204.8/api/products'; // Replace with your API endpoint

    try {
      Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json', // Include additional headers if needed
        },
      );

      if (response.statusCode == 200) {
        // Request successful, handle the response data
        food = foodFromJson(response.body);
        print(response.body);
      } else {
        // Request failed, handle the error
        error = response.statusCode.toString();
      }
    } catch (e) {
      // Exception occurred, handle the error
      print('Exception: $e');
    }

    isloading = false;
    updateData();
  }

  //Searchbar function
  Food found_items = Food(data: []);
  String searchtext = "";

  updateData() {
    found_items.data.clear();
    if (searchtext.isEmpty) {
      found_items.data.addAll(food.data);
    } else {
      found_items.data.addAll(food.data
          .where((element) =>
              element.name.toLowerCase().contains(searchtext.toLowerCase()))
          .toList());
    }
    notifyListeners();
  }

  runFilter(String enteredKeyword) {
    searchtext = enteredKeyword;
    updateData();
  }

  //API get orders
  Order order = Order(data: []);
  Future<void> makeOrderGetRequest() async {
    const token = "33|tu3oYBKxqdyBk8KtgGMSlq9KwGwsZRKs6FZJOSqle5d7896b";
    const url =
        'http://209.38.204.8/api/orders'; // Replace with your API endpoint

    try {
      Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json', // Include additional headers if needed
        },
      );

      if (response.statusCode == 200) {
        // Request successful, handle the response data
        order = orderFromJson(response.body);
        print(response.body);
      } else {
        // Request failed, handle the error
        error = response.statusCode.toString();
      }
    } catch (e) {
      // Exception occurred, handle the error
      print('Exception: $e');
    }

    isloading = false;
    updateData();
  }
}
