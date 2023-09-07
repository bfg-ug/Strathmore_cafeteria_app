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
  List<Map<String, dynamic>> popular_items = [
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
            Align(
              alignment: Alignment.center,
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today's offer",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.white),
                ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.white),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Container(
              height: 400,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: popular_items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: OpenContainer(
                      transitionDuration: Duration(milliseconds: 400),
                      transitionType: ContainerTransitionType.fade,
                      closedBuilder:
                          (BuildContext _, VoidCallback openContainer) {
                        return squareTile(
                          item: popular_items[index]["name"].toString(),
                          onTap: openContainer,
                          price: popular_items[index]["price"].toString(),
                        );
                      },
                      openBuilder: (BuildContext_, VoidCallback) {
                        return DetailScreen(
                          title: popular_items[index]["name"],
                          price: popular_items[index]["price"],
                          description: popular_items[index]["description"],
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
