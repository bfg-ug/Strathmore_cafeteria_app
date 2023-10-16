import 'package:STC/global.dart';
import 'package:STC/pages/Login%20pages/Forgot_password.dart';
import 'package:STC/pages/Login%20pages/Registration.dart';
import 'package:STC/pages/dashboard.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Text editing controller to access content
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  //Sign user in
  void signUserIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const dashboard();
    }));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: appcolors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              //Logo
              const Image(
                image: AssetImage('lib/images/strathmore.png'),
                height: 150,
              ),

              const SizedBox(height: 25),

              Text(
                "Login",
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 50),

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
              const SizedBox(height: 10),

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
                          return const Forgot_password();
                        }));
                      },
                      child: const Text(
                        'Forgot Passsword ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              //Login button
              const SizedBox(height: 25),
              submitBtn(
                onTap: signIn,
                btnText: 'Login',
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do you have an account?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const register();
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

              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
