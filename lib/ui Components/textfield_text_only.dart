import 'package:flutter/material.dart';

class textfieldOnlyText extends StatefulWidget {
  final controller;
  final String hintText;

  const textfieldOnlyText({super.key, this.controller, required this.hintText});

  @override
  State<textfieldOnlyText> createState() => _textfieldOnlyTextState();
}

class _textfieldOnlyTextState extends State<textfieldOnlyText> {
  //Check only letters
  String? containsOnlyLetters(String? input) {
    final containsOnlyLetters = RegExp(r'^[a-zA-Z]+$').hasMatch(input!);

    if (!containsOnlyLetters!) {
      return "Number, special characters and spaces are not allowed";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
        validator: containsOnlyLetters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
