import 'package:flutter/material.dart';

class textfieldPassword extends StatefulWidget {
  final controller;

  const textfieldPassword({
    super.key,
    this.controller,
  });

  @override
  State<textfieldPassword> createState() => _textfieldPasswordState();
}

class _textfieldPasswordState extends State<textfieldPassword> {
  //Checks if password is strong
  String? isStrongPassword(String? input) {
    final containsUppercase = input?.contains(RegExp(r'[A-Z]'));
    final containsLowercase = input?.contains(RegExp(r'[a-z]'));
    final containsSpecialCharacter = input?.contains(RegExp(r'[^\w\d]'));

    final isPasswordStrong = input!.length >= 8;

    if (!isPasswordStrong) {
      return "Password must be atleast 8 characters long";
    }
    if (!containsUppercase!) {
      return "Password must contain atleast one uppercase letter";
    }
    if (!containsLowercase!) {
      return "Password must contain atleast one lower letter";
    }
    if (!containsSpecialCharacter!) {
      return "Password must contain atleast Special character";
    }

    return null;
  }

//Password visibility
  bool _isVisible = true;

  Widget togglePassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: IconButton(
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
          });
        },
        icon: _isVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isVisible,
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
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.grey[400]),
          suffixIcon: togglePassword(),
        ),
        validator: isStrongPassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
