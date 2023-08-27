import 'package:flutter/material.dart';

class rectangularTile extends StatelessWidget {
  final String imagePath;
  final String text;

  rectangularTile({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,

      ),
      child: Center(
        child: Row(
          children: [
            Image.asset(imagePath, height: 40,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(text, style: TextStyle(color: Color(0xffc1aa6a), fontSize: 15, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),

    );
  }

}