import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/ui%20Components/textfield.dart';

import '../../ui Components/square-tile.dart';

class searchpage extends StatefulWidget {
  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  final List _card = ["Hello", "Hello", "Hello", "Hello"];
  final List author = ["Hello", "Hello", "Hello", "Hello"];
  final List title = ["Hello", "Hello", "Hello", "Hello"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Expanded(
          child: ListView(
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Text(
                  "Search",
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 25),
              textfield(hintText: "Search", obscureText: false),
            ],
          ),
        ),
      ),
    );
  }
}
