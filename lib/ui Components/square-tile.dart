import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/food.dart';

class squareTile extends StatelessWidget {
  final Food food;
  final Function()? onTap;

  squareTile({required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 230,
          width: 162,
          color: appcolors.backgroundColor,
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.red,
                  height: 122,
                  width: 132,
                  child: Image.asset(
                    food.imagepath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  food.name,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Ksh " + food.price,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        )),
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
    );
  }
}
