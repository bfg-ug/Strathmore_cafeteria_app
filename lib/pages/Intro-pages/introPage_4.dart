import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class introPage_4 extends StatelessWidget {
  const introPage_4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appcolors.backgroundColor,
      child: Center(
          child: Column(
        children: [
          const SizedBox(height: 100),
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  color: const Color(0xffFDE0D2),
                  height: 300,
                  width: 300,
                ),
              ),
              Container(
                  child: const Image(
                image: AssetImage('lib/images/deliver.png'),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Pickup your order and enjoy",
                style: GoogleFonts.poppins(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          )
        ],
      )),
    );
  }
}
