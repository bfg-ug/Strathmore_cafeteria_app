import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class eventCard extends StatelessWidget {
  final bool isPast;
  final child;

  const eventCard({super.key, required this.isPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: appcolors.blueAccent,
              borderRadius: BorderRadius.circular(20)),
          child: Text(child,
              style: GoogleFonts.poppins(
                  color: isPast ? Colors.white : Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
