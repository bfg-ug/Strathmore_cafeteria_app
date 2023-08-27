import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class introPage_1 extends StatelessWidget{


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
                  child: Lottie.network('https://assets2.lottiefiles.com/private_files/lf30_TBKozE.json'),),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Welcome to Educat",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              )
            ],
          )

      ),


    );

  }

}