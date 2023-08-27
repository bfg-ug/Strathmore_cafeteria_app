import 'package:flutter/material.dart';
import 'package:untitled1/pages/dashboard.dart';
import 'package:untitled1/pages/Login%20pages/Forgot_password.dart';
import 'package:untitled1/ui%20Components/SubmitBtn.dart';
import 'package:untitled1/ui%20Components/rectangular-tile.dart';
import 'package:untitled1/ui%20Components/textfield.dart';

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
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return dashboard();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Color(0xffeae9e5),
      body: SingleChildScrollView(

          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                //Logo
                Image(image: AssetImage('lib/images/Logo.png')),

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
                        onTap:(){
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
                  onTap: signUserIn, btnText: 'Login',
                ),
                SizedBox(height: 25),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or',
                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // Login with google

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    rectangularTile(imagePath: 'lib/icons/google.png', text: 'Login in with Google')
                  ],
                ),

                //Login with apple
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    rectangularTile(imagePath: 'lib/icons/apple-logo.png', text: 'Login in with Apple ')
                  ],
                ),

                // Sign up with email
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    rectangularTile(imagePath: 'lib/icons/gmail.png', text: 'Sign up with Email  ')
                  ],
                ),




              ],
            ),
          ),
        ),




    );
  }
}
