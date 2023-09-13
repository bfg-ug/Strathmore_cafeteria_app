import 'package:STC/model/shop.dart';
import 'package:STC/pages/Login.dart';
import 'package:STC/pages/additional%20pages/payByMpesa.dart';
import 'package:STC/pages/additional%20pages/payByStaffID.dart';
import 'package:STC/pages/additional%20pages/payment-successful.dart';
import 'package:STC/pages/additional%20pages/select-payment.dart';
import 'package:STC/pages/navigation-bar%20pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:STC/pages/onBoarding.dart';

int? isViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
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
      home: isViewed != 0 ? const onBoarding() : const Login(),
      routes: {
        '/cart': (context) => const cart(),
        '/paymentSelection': (context) => const paymentSelection(),
        '/paybyMpesa': (context) => const paybyMpesa(),
        '/paybyStaffID': (context) => const paybyStaffID(),
        '/paymentSuccessful': (context) => const paymentSuccessful(),
      },
    );
  }
}
