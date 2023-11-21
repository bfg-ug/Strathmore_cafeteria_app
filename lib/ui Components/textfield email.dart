import 'package:flutter/material.dart';

class textfieldEmail extends StatefulWidget {
  final controller;

  const textfieldEmail({super.key, this.controller});

  @override
  State<textfieldEmail> createState() => _textfieldState();
}

class _textfieldState extends State<textfieldEmail> {
  String? isValidEmail(String? email) {
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    final isValid = emailRegex.hasMatch(email!);

    if (!isValid) {
      return "Enter valid email";
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
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
        validator: isValidEmail,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
