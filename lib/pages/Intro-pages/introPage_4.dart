import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:STC/global.dart';

class introPage_4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appcolors.backgroundColor,
      child: Center(
          child: Column(
        children: [
          SizedBox(height: 200),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                    color: Color(0xffFDE0D2),
                    height: 300,
                    width: 300,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Image(
                    image: AssetImage('lib/images/deliver.png'),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Pickup your order and enjoy",
                style: GoogleFonts.poppins(
                    fontSize: 44,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          )
        ],
      )),
    );
  }
}
