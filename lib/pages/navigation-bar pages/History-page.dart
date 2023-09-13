import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class historypage extends StatelessWidget {
  const historypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        child: ListView(
          children: [
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Your orders",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 25),
            Image.asset('lib/images/empty-cart.png'),
          ],
        ),
      ),
    );
  }
}
