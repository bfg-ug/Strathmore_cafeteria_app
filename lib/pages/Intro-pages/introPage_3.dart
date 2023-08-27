import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class introPage_3 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeae9e5),

      child: Center(

          child: Column(
            children: [

              SizedBox(height: 200),

              Container(
                  padding: EdgeInsets.all(20),
                  child: Lottie.network('https://assets6.lottiefiles.com/packages/lf20_QpolL2.json')),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Chat directly with both students and teachers ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          )


      ),



    );

  }

}