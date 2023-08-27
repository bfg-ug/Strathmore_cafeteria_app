import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class introPage_4 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeae9e5),
      child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_1a8dx7zj.json')),
              
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Browse through Our Library of academic material both offline and online",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              )
            ],
          )),
    );
  }
}
