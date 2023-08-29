import 'package:flutter/material.dart';
import 'package:STC/global.dart';
import 'package:STC/pages/Login.dart';
import 'package:STC/pages/dashboard.dart';
import 'package:STC/pages/Login%20pages/Forgot_password.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/rectangular-tile.dart';
import 'package:STC/ui%20Components/textfield.dart';

class register extends StatefulWidget {
  register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  //Text editing controller to access content
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  //Sign user in
  void createAccount() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Login();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appcolors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              //Logo
              Image(
                image: AssetImage('lib/images/strathmore.png'),
                height: 200,
              ),

              SizedBox(height: 25),

              Text(
                "Registration",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'Poppins'),
              ),

              SizedBox(height: 25),

              //Text input for email
              textfield(
                  controller: usernameController,
                  hintText: 'Name',
                  obscureText: false),

              SizedBox(height: 25),

              //Text input for email
              textfield(
                  controller: usernameController,
                  hintText: 'Registration number',
                  obscureText: false),

              SizedBox(height: 25),

              // input for password
              textfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true),

              SizedBox(height: 25),

              // input for password
              textfield(
                  controller: passwordController,
                  hintText: 'Re-enter Password',
                  obscureText: true),
              //Login button
              SizedBox(height: 25),
              submitBtn(
                onTap: createAccount,
                btnText: 'Create Account',
              ),

              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  children: [
                    Text("Already have an account? ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
