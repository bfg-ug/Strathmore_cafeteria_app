import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class introPage_2 extends StatelessWidget {
  const introPage_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appcolors.backgroundColor,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
                  child: const Image(
                    image: AssetImage('lib/images/order.png'),
                  )),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Order your food on the app",
                style: GoogleFonts.poppins(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
