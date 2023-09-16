import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class paymentTile extends StatelessWidget {
  final String imagePath;
  final String text;
  final String route;

  paymentTile(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Material(
            elevation: 20,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(20)),
              height: 120,
              width: 120,
              child: Image.asset(imagePath),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
