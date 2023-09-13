import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:STC/ui%20Components/square-tile.dart';
import '../../model/food.dart';
import '../../ui Components/detail-page.dart';
import '../../ui Components/rectangular-tile.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List<Food> popular_items = [
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

  final List<Food> todays_Offers = [
    Food(
        price: "1200",
        name: "Two for one special",
        imagepath: "lib/images/burger 3.png",
        rating: "5"),
    Food(
        price: "2000",
        name: "Ugandan matooke",
        imagepath: "lib/images/food.jpg",
        rating: "5"),
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
            const SizedBox(height: 25),
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
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: todays_Offers.length,
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
                          food: todays_Offers[index],
                          onTap: openContainer,
                        );
                      },
                      openBuilder: (BuildContext_, VoidCallback) {
                        return DetailScreen(
                          food: todays_Offers[index],
                        );
                      },
                    ),
                  );

                  //rectangularTile(imagePath: _banner[index]);
                },
              ),
            ),
            const SizedBox(height: 25),

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
            SizedBox(
              height: 400,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: popular_items.length,
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
                          food: popular_items[index],
                        );
                      },
                      openBuilder: (BuildContext_, VoidCallback) {
                        return DetailScreen(
                          food: popular_items[index],
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
