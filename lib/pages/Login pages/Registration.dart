import 'package:flutter/material.dart';
import 'package:STC/global.dart';
import 'package:STC/pages/Login.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/textfield.dart';

class register extends StatefulWidget {
  const register({super.key});

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
      return const Login();
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
              const SizedBox(height: 50),
              //Logo
              const Image(
                image: AssetImage('lib/images/strathmore.png'),
                height: 200,
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

              //Text input for email
              textfield(
                  controller: usernameController,
                  hintText: 'Name',
                  obscureText: false),

              const SizedBox(height: 25),

              //Text input for email
              textfield(
                  controller: usernameController,
                  hintText: 'Registration number',
                  obscureText: false),

              const SizedBox(height: 25),

              // input for password
              textfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true),

              const SizedBox(height: 25),

              // input for password
              textfield(
                  controller: passwordController,
                  hintText: 'Re-enter Password',
                  obscureText: true),
              //Login button
              const SizedBox(height: 25),
              submitBtn(
                onTap: createAccount,
                btnText: 'Create Account',
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  children: [
                    const Text("Already have an account? ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Login();
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
