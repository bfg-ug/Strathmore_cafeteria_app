import 'package:flutter/material.dart';

class submitBtn extends StatelessWidget {
  final String btnText;

  const submitBtn({super.key, required this.onTap, required this.btnText});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
            end:  Alignment.centerRight,
            colors: [
          Color(0xffc1aa6a),
          Color(0xffb9b5a8)
        ]),
        borderRadius:BorderRadius.circular(15) ),
        child:  Center(
          child: Text(btnText, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
