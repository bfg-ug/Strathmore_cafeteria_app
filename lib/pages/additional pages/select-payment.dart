import 'package:STC/global.dart';
import 'package:STC/ui%20Components/payment-tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class paymentSelection extends StatelessWidget {
  const paymentSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors.backgroundColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      backgroundColor: appcolors.backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            "Select payment method",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 100),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                paymentTile(
                    imagePath: "lib/images/mpesa.png",
                    text: "Mpesa",
                    route: '/paybyMpesa'),
                paymentTile(
                    imagePath: "lib/images/Card.png",
                    text: "Staff/Student Id",
                    route: '/paybyStaffID'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
