import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/pages/Splashscreen.dart';
import 'package:untitled1/pages/onBoarding.dart';

int? isViewed;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

// when the app starts it will start from the deignated page home
  @override
Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:isViewed !=0 ? onBoarding(): Splashscreen(),
    );
  }
}
