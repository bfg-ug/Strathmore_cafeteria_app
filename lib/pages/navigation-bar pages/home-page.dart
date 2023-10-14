import 'package:STC/ui%20Components/square-tile.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/food.dart';
import '../../ui Components/detail-page.dart';
import '../../ui Components/rectangular-tile.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          // menu
          if (_todays_Offers.isEmpty) ...[
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome back",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ] else ...[
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome back",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _todays_Offers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: OpenContainer(
                        closedElevation: 10,
                        closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        transitionDuration: const Duration(milliseconds: 400),
                        transitionType: ContainerTransitionType.fade,
                        closedBuilder:
                            (BuildContext _, VoidCallback openContainer) {
                          return rectangularTile(
                            food: _todays_Offers[index],
                            onTap: openContainer,
                          );
                        },
                        openBuilder: (BuildContext_, VoidCallback) {
                          return DetailScreen(
                            food: _todays_Offers[index],
                          );
                        },
                      ),
                    );

                    //rectangularTile(imagePath: _banner[index]);
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],

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
            height: 500,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _popular_items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: OpenContainer(
                    closedElevation: 10,
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    transitionDuration: const Duration(milliseconds: 400),
                    transitionType: ContainerTransitionType.fade,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return squareTile(
                        onTap: openContainer,
                        food: _popular_items[index],
                      );
                    },
                    openBuilder: (BuildContext_, VoidCallback) {
                      return DetailScreen(
                        food: _popular_items[index],
                      );
                    },
                  ),
                );
              },
            ),
          ),

          //Popular Items
        ],
      ),
    );
  }
}
