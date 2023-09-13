import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/food.dart';

class squareTile extends StatelessWidget {
  final Food food;
  final Function()? onTap;

  const squareTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: appcolors.blueAccent,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: Container(
                  child: Image.asset(
                    food.imagepath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  food.name,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Ksh ${food.price}",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
