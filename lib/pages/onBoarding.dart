import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled1/pages/Intro-pages/introPage_1.dart';
import 'package:untitled1/pages/Intro-pages/introPage_2.dart';
import 'package:untitled1/pages/Intro-pages/introPage_3.dart';
import 'package:untitled1/pages/Login.dart';

import 'Intro-pages/introPage_4.dart';

class onBoarding extends StatefulWidget {
  onBoarding({Key? key});

  @override
  _onBoardingScreenState createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoarding> {
  //controller to keep track of which page we are on
  PageController _onBoardingcontroller = PageController();

  //Keep Track if we are on the last page or not
  bool onLastpage = false;

  storedinfo()async{
    int isViewed =  0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _onBoardingcontroller,
          onPageChanged: (index) {
            setState(() {
              onLastpage = (index == 3);
            });
          },
          children: [
            introPage_1(),
            introPage_2(),
            introPage_3(),
            introPage_4(),
          ],
        ),

        //Dot indicator
        Container(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Button to skip
                GestureDetector(
                    onTap: () {
                      _onBoardingcontroller.jumpToPage(3);
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              color: Color(0xffc1aa6a),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ))),

                SmoothPageIndicator(
                    controller: _onBoardingcontroller, count: 4),

                //Button to next/Done
                if (onLastpage)
                  GestureDetector(
                      onTap: () async {
                        await storedinfo();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Done",
                            style: TextStyle(
                                color: Color(0xffc1aa6a),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )))
                else
                  GestureDetector(
                      onTap: () {
                        _onBoardingcontroller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),

                          child: Text("Next", style: TextStyle(color: Color(0xffc1aa6a), fontSize: 16, fontWeight: FontWeight.bold),))),
              ],
            ))
      ],
    ));
  }
}
