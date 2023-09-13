import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:STC/global.dart';
import 'package:google_fonts/google_fonts.dart';

class paybyMpesa extends StatelessWidget {
  const paybyMpesa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors.backgroundColor,
        elevation: 0,
      ),
      backgroundColor: appcolors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              "Mpesa",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            Image.asset("lib/images/mpesa.png"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Enter phone number in order to be prompted",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const textfield(hintText: "07*********", obscureText: false),
            const SizedBox(height: 25),
            submitBtn(
                onTap: () {
                  Navigator.pushNamed(context, '/paymentSuccessful');
                },
                btnText: " Send prompt")
          ],
        ),
      ),
    );
  }
}
