import 'package:STC/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui Components/SubmitBtn.dart';
import '../../ui Components/textfield.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  //Text editing controller to access content
  final _emailController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ConfirmpasswordController = TextEditingController();

  //confirm password

  @override
  void dispose() {
    _emailController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _passwordController.dispose();
    _ConfirmpasswordController.dispose();
    super.dispose();
  }

  // Initial Selected Value
  String dropdownvalue = 'Student';

  // List of items in our dropdown menu
  List<String> items = ['Student', 'Lecturer', 'Alumni', 'Staff'];

  //Sign user in
  Future createAccount() async {
    if (_firstnameController.text.trim().isNotEmpty ||
        _lastnameController.text.trim().isNotEmpty ||
        _passwordController.text.trim().isNotEmpty ||
        _ConfirmpasswordController.text.trim().isNotEmpty) {
      if (passwordConfirm()) {
        //Create auth user
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim())
            .then((value) => {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(value.user?.uid)
                      .set({
                    'First name': _firstnameController.text.trim(),
                    'Last name': _lastnameController.text.trim(),
                    'User type': dropdownvalue.trim(),
                    'Email': _emailController.text.trim(),
                  })
                });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text("All fields must filled"),
              ));
    }
  }

  Future addUserDetail(String firstName, lastName, usertype, email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'First name': firstName,
      'Last name': lastName,
      'User type': usertype,
      'Email': email,
    });

    Navigator.pushNamed(context, '/homepage');
  }

  bool passwordConfirm() {
    if (_passwordController.text.trim() ==
        _ConfirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: appcolors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 25),
              //Logo
              const Image(
                image: AssetImage('lib/images/strathmore.png'),
                height: 150,
              ),

              const SizedBox(height: 25),

              const Text(
                "Registration",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'Poppins'),
              ),

              const SizedBox(height: 25),

              //Text input for first name
              textfield(
                  controller: _firstnameController,
                  hintText: 'First Name',
                  obscureText: false),

              const SizedBox(height: 25),

              //Text input last name
              textfield(
                  controller: _lastnameController,
                  hintText: 'Last Name',
                  obscureText: false),

              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 0,
                      isExpanded: true,
                      dropdownColor: Colors.white,

                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              //Text input for email
              textfield(
                  controller: _emailController,
                  hintText: 'Email',
                  obscureText: false),

              const SizedBox(height: 25),

              // input for password
              textfield(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true),

              const SizedBox(height: 25),

              // input for Re-password
              textfield(
                  controller: _ConfirmpasswordController,
                  hintText: 'Re-enter Password',
                  obscureText: true),

              //Create account button
              const SizedBox(height: 25),
              submitBtn(
                onTap: createAccount,
                btnText: 'Create Account',
              ),

              const SizedBox(height: 25),

              // Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: appcolors.orangeAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
