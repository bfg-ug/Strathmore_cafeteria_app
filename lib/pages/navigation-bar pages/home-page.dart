import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:STC/ui%20Components/square-tile.dart';
import 'package:STC/ui%20Components/vertical%20Rectangular%20tile.dart';

import '../../ui Components/detail-page.dart';
import '../../ui Components/rectangular-tile.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
  ];

  final List _banner = [
    "lib/images/food.jpg",
    "lib/images/food.jpg",
    "lib/images/burger 3.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // menu
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: Text(
                "Menu",
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),

            // Todays offers
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Today's offer",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _banner.length,
                itemBuilder: (context, index) {
                  return rectangularTile(imagePath: _banner[index]);
                },
              ),
            ),
            SizedBox(height: 25),

            //Popular Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Popular",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.white),
                textAlign: TextAlign.end,
              ),
            ),
            Container(
              height: 400,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _items.length,
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
                          item: _items[index]["id"].toString(),
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
