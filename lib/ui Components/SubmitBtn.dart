import 'package:flutter/material.dart';

class submitBtn extends StatelessWidget {
  final String btnText;

  const submitBtn({super.key, required this.onTap, required this.btnText});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color(0xffFB8904),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                btnText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
