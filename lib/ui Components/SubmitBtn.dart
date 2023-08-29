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
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Color(0xffFB8904), borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
