import 'package:STC/global.dart';
import 'package:STC/ui%20Components/square-tile.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/shop.dart';
import '../../ui Components/detail-page.dart';
import '../../ui Components/rectangular-tile.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<shop>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  // menu
                  if (value.todays_offer.isEmpty) ...[
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
                    Column(
                      children: [
                        Container(
                          height: 200,
                          child: PageView.builder(
                              itemCount: value.todays_offer.length,
                              pageSnapping: true,
                              controller: _pageController,
                              itemBuilder: (context, pagePosition) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: OpenContainer(
                                    closedElevation: 10,
                                    closedShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                    transitionType:
                                        ContainerTransitionType.fade,
                                    closedBuilder: (BuildContext _,
                                        VoidCallback openContainer) {
                                      return rectangularTile(
                                        food: value.todays_offer[pagePosition],
                                        onTap: openContainer,
                                      );
                                    },
                                    openBuilder: (BuildContext_, VoidCallback) {
                                      return DetailScreen(
                                        food: value.todays_offer[pagePosition],
                                      );
                                    },
                                  ),
                                );
                              }),
                        ),
                        SizedBox(height: 10),
                        SmoothPageIndicator(
                            effect: SlideEffect(
                                activeDotColor: appcolors.orangeAccent,
                                dotHeight: 10,
                                dotWidth: 10),
                            controller: _pageController,
                            count: value.todays_offer.length),
                      ],
                    ),
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
                    height: 450,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.popular_items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: OpenContainer(
                            closedElevation: 10,
                            closedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            transitionDuration:
                                const Duration(milliseconds: 400),
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

                  //Popular Items
                ],
              ),
            ));
  }
}
