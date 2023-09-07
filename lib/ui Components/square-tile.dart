import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class squareTile extends StatelessWidget {
  final String item;
  final String price;
  final Function()? onTap;

  squareTile({required this.item, this.onTap, required this.price});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 50,
          child: Container(
            height: 80,
            width: 80,
            color: appcolors.backgroundColor,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 150,
                    child: Image.asset(
                      "lib/images/food.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Ksh " + price,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ),
                    ),
                    SvgPicture.asset(
                      "lib/icons/plus.svg",
                      height: 30,
                      width: 30,
                      color: appcolors.orangeAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
