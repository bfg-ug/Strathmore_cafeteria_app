import 'package:STC/global.dart';
import 'package:flutter/material.dart';
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
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }


  bool paymentSuccess = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.backgroundColor,
      body: Center(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    if (paymentSuccess == false) ...[
                      Lottie.asset("lib/images/failure_animation.json",
                          controller: _controller,
                          repeat: false, onLoaded: (composition) {
                        _controller.duration = const Duration(seconds: 2);
                        _controller.forward();
                        _controller.addStatusListener((status) async {
                          if (status == AnimationStatus.completed) {
                            Navigator.pop(context);
                          }
                        });
                      }),
                      const SizedBox(height: 100),
                      Text("Payment Failed",
                          style: GoogleFonts.poppins(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("Please try again",
                          style: GoogleFonts.poppins(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ] else if (paymentSuccess == true) ...[
                      Lottie.asset("lib/images/animation_lmglt8ep.json",
                          controller: _controller, onLoaded: (composition) {
                        _controller.forward();
                        _controller.addStatusListener((status) async {
                          if (status == AnimationStatus.completed) {
                            Navigator.pushNamed(context, '/homepage');
                          }
                        });
                      }),
                      Text("Payment Successul",
                          style: GoogleFonts.poppins(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
