import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui Components/textfield.dart';

class historypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        child: ListView(
          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 110),
              child: Text(
                "Your orders",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 25),
            Image.asset('lib/images/empty-cart.png'),
          ],
        ),
      ),
    );
  }
}
