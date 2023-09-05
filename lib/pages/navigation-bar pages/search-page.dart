import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:STC/ui%20Components/textfield.dart';

import '../../ui Components/detail-page.dart';
import '../../ui Components/square-tile.dart';

class searchpage extends StatefulWidget {
  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  List<Map<String, dynamic>> _items = [
    {
      "id": 1,
      "name": "Chicken",
      "price": 200,
      "description": "Finger licking good"
    },
    {
      "id": 2,
      "name": "beef",
      "price": 100,
      "description": "Finger licking good"
    },
    {
      "id": 3,
      "name": "goat",
      "price": 2200,
      "description": "Finger licking good"
    },
    {
      "id": 4,
      "name": "Lamb",
      "price": 1100,
      "description": "Finger licking good"
    },
    {
      "id": 5,
      "name": "Fish",
      "price": 200,
      "description": "Finger licking good"
    },
    {
      "id": 6,
      "name": "Calamary",
      "price": 100,
      "description": "Finger licking good"
    },
    {
      "id": 7,
      "name": "pork",
      "price": 2200,
      "description": "Finger licking good"
    },
    {
      "id": 8,
      "name": "Hippo",
      "price": 1100,
      "description": "Finger licking good"
    },
  ];
  List<Map<String, dynamic>> found_items = [];

  @override
  void initState() {
    found_items = _items;
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      results = _items;
    } else {
      results = _items
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    setState(() {
      found_items = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: Text(
                "Search",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 25),
            TextField(
              onChanged: (value) => runFilter(value),
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                itemCount: found_items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OpenContainer(
                      transitionDuration: Duration(milliseconds: 400),
                      transitionType: ContainerTransitionType.fade,
                      closedBuilder:
                          (BuildContext _, VoidCallback openContainer) {
                        return squareTile(
                          item: found_items[index]["name"].toString(),
                          onTap: openContainer,
                        );
                      },
                      openBuilder: (BuildContext_, VoidCallback) {
                        return DetailScreen(
                          title: _items[index]["name"],
                          price: _items[index]["price"],
                          description: _items[index]["description"],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
