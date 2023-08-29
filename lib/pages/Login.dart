import 'package:flutter/material.dart';
import 'package:STC/global.dart';
import 'package:STC/pages/Login%20pages/Registration.dart';
import 'package:STC/pages/dashboard.dart';
import 'package:STC/pages/Login%20pages/Forgot_password.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/rectangular-tile.dart';
import 'package:STC/ui%20Components/textfield.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Text editing controller to access content
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  //Sign user in
  void signUserIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return dashboard();
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
              SizedBox(height: 100),
              //Logo
              Image(
                image: AssetImage('lib/images/strathmore.png'),
                height: 200,
              ),

              SizedBox(height: 25),

              Text(
                "Login",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'Poppins'),
              ),

              SizedBox(height: 50),

              //Text input for email
              textfield(
                  controller: usernameController,
                  hintText: 'Email',
                  obscureText: false),

              SizedBox(height: 25),

              // input for password
              textfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true),
              SizedBox(height: 10),

              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Forgot_password();
                        }));
                      },
                      child: Text(
                        'Forgot Passsword ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              //Login button
              SizedBox(height: 25),
              submitBtn(
                onTap: signUserIn,
                btnText: 'Login',
              ),

              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: [
                    Text("Do you have an account?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return register();
                        }));
                      },
                      child: Text(
                        "Create Account",
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
