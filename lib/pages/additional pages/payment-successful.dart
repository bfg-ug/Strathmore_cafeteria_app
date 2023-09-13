import 'package:flutter/material.dart';
import 'package:STC/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class paymentSuccessful extends StatefulWidget {
  const paymentSuccessful({super.key});

  @override
  State<paymentSuccessful> createState() => _paymentSuccessfulState();
}

class _paymentSuccessfulState extends State<paymentSuccessful>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }


  bool paymentSuccess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.backgroundColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.asset("lib/images/animation_lmglt8ep.json"),
            ),
            Text("Payment Successful",
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
