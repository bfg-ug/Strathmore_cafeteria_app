import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:STC/ui%20Components/square-tile.dart';
import 'package:STC/ui%20Components/vertical%20Rectangular%20tile.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: ListView(
          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: Text(
                "Menu",
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Today's offer",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
