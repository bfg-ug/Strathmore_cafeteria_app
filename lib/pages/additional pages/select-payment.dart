import 'package:flutter/material.dart';
import 'package:STC/global.dart';
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
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/paybyStaffID');
                  },
                  child: Column(
                    children: [
                      Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(20)),
                          height: 120,
                          width: 120,
                          child: Image.asset("lib/images/Card.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Student/Staff ID",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/paybyMpesa');
                  },
                  child: Column(
                    children: [
                      Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(20)),
                          height: 120,
                          width: 120,
                          child: Image.asset("lib/images/mpesa.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Mpesa",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
