import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SubmitBtn.dart';
import 'square-tile.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final int price;
  final String description;

  DetailScreen(
      {required this.title, required this.price, required this.description});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
  int price = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appcolors.backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: appcolors.backgroundColor,
          elevation: 0,
          toolbarHeight: 80,
        ),
        body: Stack(
          children: [
            Container(
                height: 400,
                child: Container(
                  child: Image.asset(
                    "lib/images/food.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(52),
                        topRight: Radius.circular(52)),
                    child: Container(
                      width: 500,
                      color: appcolors.backgroundColor,
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Text("title",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                )),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Text("hi",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                )),
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: SvgPicture.asset(
                                  "lib/icons/plus.svg",
                                  height: 30,
                                  width: 30,
                                  color: appcolors.orangeAccent,
                                ),
                              ),
                              Text(quantity.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 20, color: Colors.white)),
                              GestureDetector(
                                onTap: () {
                                  if (quantity < 0) {
                                    setState(() {
                                      quantity = 0;
                                    });
                                  } else {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },
                                child: SvgPicture.asset(
                                  "lib/icons/minus.svg",
                                  height: 30,
                                  width: 30,
                                  color: appcolors.orangeAccent,
                                ),
                              ),
                              Text(
                                "Ksh: ",
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(price.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 50),
                          submitBtn(
                            onTap: () {},
                            btnText: 'Add to Cart',
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}
