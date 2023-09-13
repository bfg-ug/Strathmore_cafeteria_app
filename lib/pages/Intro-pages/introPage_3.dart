import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:STC/global.dart';

class introPage_3 extends StatelessWidget {
  const introPage_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appcolors.backgroundColor,
      child: Center(
          child: Column(
        children: [
          const SizedBox(height: 200),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                    color: const Color(0xffFDE0D2),
                    height: 300,
                    width: 300,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: const Image(
                    image: AssetImage('lib/images/pay.png'),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Pay",
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
