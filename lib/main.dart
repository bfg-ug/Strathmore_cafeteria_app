import 'package:STC/model/shop.dart';
import 'package:STC/pages/Login%20pages/Forgot_password.dart';
import 'package:STC/pages/Login%20pages/preload.dart';
import 'package:STC/pages/Login.dart';
import 'package:STC/pages/additional%20pages/edit-profile.dart';
import 'package:STC/pages/additional%20pages/payByMpesa.dart';
import 'package:STC/pages/additional%20pages/payByStaffID.dart';
import 'package:STC/pages/additional%20pages/payment-successful.dart';
import 'package:STC/pages/additional%20pages/select-payment.dart';
import 'package:STC/pages/dashboard.dart';
import 'package:STC/pages/navigation-bar%20pages/cart.dart';
import 'package:STC/pages/navigation-bar%20pages/profile-page.dart';
import 'package:STC/pages/onBoarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');

  MpesaFlutterPlugin.setConsumerKey("MWYdTWc7xxyY4nA2jw0QXonqpn1bsz15");
  MpesaFlutterPlugin.setConsumerSecret("2xyuB0MBNmlqfFaG");

  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// when the app starts it will start from the deignated page home
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isViewed != 0 ? const onBoarding() : const preload(),
      routes: {
        '/cart': (context) => const cart(),
        '/paymentSelection': (context) => const paymentSelection(),
        '/paybyMpesa': (context) => const paybyMpesa(),
        '/paybyStaffID': (context) => const paybyStaffID(),
        '/paymentSuccessful': (context) => const paymentSuccessful(),
        '/homepage': (context) => const dashboard(),
        '/resetPassword': (context) => const Forgot_password(),
        '/profilepage': (context) => const profile(),
        '/login': (context) => const Login(),
        '/edit': (context) => const editprofile(),
      },
    );
  }
}
