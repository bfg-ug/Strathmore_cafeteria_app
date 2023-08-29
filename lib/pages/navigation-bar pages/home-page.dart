import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/ui%20Components/square-tile.dart';
import 'package:untitled1/ui%20Components/vertical%20Rectangular%20tile.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List _card = ["first", "second", "third"];
  final List author = ["first", "second", "third"];
  final List title = ["first", "second", "third"];

  @override
  Widget build(BuildContext context) {
    //This if checks if a user has inprogress courses or not
    if (_card.isEmpty || author.isEmpty || title.isEmpty) {
      return Container(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 100),
                Image.asset("lib/images/background.png"),
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: ListView(
            children: [
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
}
