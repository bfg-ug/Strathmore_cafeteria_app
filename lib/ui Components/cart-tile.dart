import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cartTile extends StatelessWidget {
  final String foodname;
  final String imagepath;
  final int foodprice;
  final int quantity;

  const cartTile(
      {super.key,
      required this.foodname,
      required this.imagepath,
      required this.foodprice,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
              color: appcolors.blueAccent,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        child: Image.asset(imagepath, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // food name
                        Text(
                          foodname,
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),

                        // food price
                        Text(
                          "Ksh: $foodprice",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),

                        // food quantity
                        Text("Quantity: $quantity",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
