import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/food.dart';
import '../../ui Components/detail-page.dart';
import '../../ui Components/square-tile.dart';

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  List<Food> all_items = [
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

  late List<Food> found_items;

  @override
  void initState() {
    found_items = all_items;
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List<Food> results = [];

    if (enteredKeyword.isEmpty) {
      results = all_items;
    } else {
      results = all_items
          .where((element) =>
              element.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      found_items = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Search",
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 25),
          TextField(
            onChanged: (value) => runFilter(value),
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              fillColor: Colors.white,
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: Icon(Icons.search_off_outlined),
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: GridView.builder(
              itemCount: found_items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OpenContainer(
                    closedElevation: 20,
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    transitionDuration: const Duration(milliseconds: 400),
                    transitionType: ContainerTransitionType.fade,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return squareTile(
                        onTap: openContainer,
                        food: found_items[index],
                      );
                    },
                    openBuilder: (BuildContext_, VoidCallback) {
                      return DetailScreen(
                        food: found_items[index],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
