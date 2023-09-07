import 'package:STC/model/shop.dart';
import 'package:STC/pages/navigation-bar%20pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:STC/pages/Splashscreen.dart';
import 'package:STC/pages/onBoarding.dart';

int? isViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(
    ChangeNotifierProvider(
      create: (context) => shop(),
      child: MyApp(),
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
      home: isViewed != 0 ? onBoarding() : Splashscreen(),
      routes: {
        '/cart': (context) => cart(),
      },
    );
  }
}
