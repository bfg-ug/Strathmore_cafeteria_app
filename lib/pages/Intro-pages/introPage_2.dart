import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class introPage_2 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeae9e5),

      child: Center(

          child: Column(
            children: [

              SizedBox(height: 220),
              Container(

                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_fq7pwzey.json'),
                  )),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Take Tailored Online courses made by Uneb trained teachers",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              )
            ],
          )),


    );

  }

}