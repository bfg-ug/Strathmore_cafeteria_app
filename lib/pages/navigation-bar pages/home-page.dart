import 'package:STC/model/shop.dart';
import 'package:STC/ui%20Components/square-tile.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../ui Components/detail-page.dart';
import '../../ui Components/rectangular-tile.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<shop>(
      builder: (context, value, child) => Padding(
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
                  itemCount: value.todays_offer.length,
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
                            food: value.todays_offer[index],
                            onTap: openContainer,
                          );
                        },
                        openBuilder: (BuildContext_, VoidCallback) {
                          return DetailScreen(
                            food: value.todays_offer[index],
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
                  itemCount: value.popular_items.length,
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
                            food: value.popular_items[index],
                          );
                        },
                        openBuilder: (BuildContext_, VoidCallback) {
                          return DetailScreen(
                            food: value.popular_items[index],
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
      ),
    );
  }
}
