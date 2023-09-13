import 'package:flutter/material.dart';
import 'package:STC/global.dart';
import 'package:STC/pages/Login.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/textfield.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({super.key});

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  //Text editing controller to access content
  final emailController = TextEditingController();

  //Reset password function
  void reset() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const Login();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors.backgroundColor,
        elevation: 0,
        leading: const BackButton(),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: appcolors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              //Logo
              const Image(image: AssetImage('lib/images/strathmore.png')),

              const SizedBox(height: 25),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'Poppins'),
                ),
              ),

              const SizedBox(height: 25),

              // input for user email
              textfield(
                  controller: emailController,
                  hintText: 'Enter new password',
                  obscureText: false),

              const SizedBox(height: 25),

              // input for user email
              textfield(
                  controller: emailController,
                  hintText: 'Re-enter new password',
                  obscureText: false),

              //Submit button
              const SizedBox(height: 50),
              submitBtn(
                onTap: reset,
                btnText: 'Reset',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
