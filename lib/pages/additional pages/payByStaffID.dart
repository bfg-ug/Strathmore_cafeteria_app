import 'package:flutter/material.dart';
import 'package:STC/global.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui Components/SubmitBtn.dart';
import '../../ui Components/textfield.dart';

class paybyStaffID extends StatelessWidget {
  const paybyStaffID({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors.backgroundColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      backgroundColor: appcolors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 75),
            Text(
              "Student/Staff ID",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            Image.asset("lib/images/Card.png"),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Enter ID number",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const textfield(hintText: "123456", obscureText: false),
            const SizedBox(height: 25),
            submitBtn(
                onTap: () {
                  Navigator.pushNamed(context, '/paymentSuccessful');
                },
                btnText: "Pay")
          ],
        ),
      ),
    );
  }
}
