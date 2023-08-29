import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/Login.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'lib/images/strathmore.png',
      nextScreen: Login(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
