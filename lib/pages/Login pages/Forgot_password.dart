import 'package:flutter/material.dart';
import 'package:STC/global.dart';
import 'package:STC/pages/additional%20pages/otp-check.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/textfield.dart';

class Forgot_password extends StatefulWidget {
  const Forgot_password({super.key});

  @override
  State<Forgot_password> createState() => _Forgot_passwordState();
}

class _Forgot_passwordState extends State<Forgot_password> {
  //Text editing controller to access content
  final emailController = TextEditingController();

  //Reset password function
  void resetPassword() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const otpCheck();
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
                  "Reset password",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'Poppins'),
                ),
              ),

              const SizedBox(height: 25),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Enter the email associated with your account and we 'll send email with instructions to reset your password",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),

              const SizedBox(height: 25),

              // input for user email
              textfield(
                  controller: emailController,
                  hintText: 'example@example.com',
                  obscureText: false),
              const SizedBox(height: 10),

              //Submit button
              const SizedBox(height: 25),
              submitBtn(
                onTap: resetPassword,
                btnText: 'Send OTP',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
