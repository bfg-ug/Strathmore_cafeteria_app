import 'package:STC/global.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/food.dart';
import '../../model/shop.dart';
import '../../ui Components/detail-page.dart';
import '../../ui Components/rectangular-tile.dart';
import '../../ui Components/square-tile.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    Provider.of<shop>(context as BuildContext, listen: false).makeGetRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<shop>(
        builder: (context, value, child) => value.isloading
            ? getLoadingUI()
            : value.error.isNotEmpty
                ? getErrorUI(value.error)
                : getBodyUI(value.food));
  }
}

Widget getLoadingUI() {
  return const Center(child: CircularProgressIndicator());
}

Widget getErrorUI(String error) {
  return Center(
      child: Text(
    error,
    style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
  ));
}

Widget getBodyUI(Food food) {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
  }

  return Padding(
    padding: const EdgeInsets.all(10),
    child: ListView(
      children: [
        // menu
        if (food.data.isNotEmpty) ...[
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
              SizedBox(
                height: 200,
                child: PageView.builder(
                    itemCount: 3,
                    pageSnapping: true,
                    controller: pageController,
                    itemBuilder: (context, pagePosition) {
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
                              food: food.data[pagePosition],
                              onTap: openContainer,
                            );
                          },
                          openBuilder: (BuildContext_, VoidCallback) {
                            return DetailScreen(
                              food: food.data[pagePosition],
                            );
                          },
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                  effect: SlideEffect(
                      activeDotColor: appcolors.orangeAccent,
                      dotHeight: 10,
                      dotWidth: 10),
                  controller: pageController,
                  count: food.data.length),
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

        SizedBox(
          height: 450,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
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
                  closedBuilder: (BuildContext _, VoidCallback openContainer) {
                    return squareTile(
                      onTap: openContainer,
                      food: food.data[index],
                    );
                  },
                  openBuilder: (BuildContext_, VoidCallback) {
                    return DetailScreen(
                      food: food.data[index],
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

  // return ListView.builder(
  //     itemCount: food.data.length,
  //     itemBuilder: (context, index) => ListTile(
  //           title: Text(food.data[index].name),
  //         ));
}
