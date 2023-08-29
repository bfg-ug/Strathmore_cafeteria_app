import 'package:flutter/material.dart';
import 'package:untitled1/global.dart';
import 'package:untitled1/pages/Login.dart';
import 'package:untitled1/ui%20Components/SubmitBtn.dart';
import 'package:untitled1/ui%20Components/textfield.dart';

class resetPassword extends StatefulWidget {
  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  //Text editing controller to access content
  final emailController = TextEditingController();

  //Reset password function
  void reset() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Login();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors.backgroundColor,
        elevation: 0,
        leading: BackButton(),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: appcolors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              //Logo
              Image(image: AssetImage('lib/images/strathmore.png')),

              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'Poppins'),
                ),
              ),

              SizedBox(height: 25),

              // input for user email
              textfield(
                  controller: emailController,
                  hintText: 'Enter new password',
                  obscureText: false),

              SizedBox(height: 25),

              // input for user email
              textfield(
                  controller: emailController,
                  hintText: 'Re-enter new password',
                  obscureText: false),

              //Submit button
              SizedBox(height: 50),
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
