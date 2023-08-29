import 'package:flutter/material.dart';
import 'package:STC/global.dart';
import 'package:STC/pages/additional%20pages/password-reset.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/textfield.dart';

class otpCheck extends StatefulWidget {
  @override
  State<otpCheck> createState() => _otpCheckState();
}

class _otpCheckState extends State<otpCheck> {
  //Text editing controller to access content
  final emailController = TextEditingController();

  //Reset password function
  void verifyOTP() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return resetPassword();
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
                  "Enter OTP",
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
                  hintText: '',
                  obscureText: false),
              SizedBox(height: 10),

              //Submit button
              SizedBox(height: 25),
              submitBtn(
                onTap: verifyOTP,
                btnText: 'Verify',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
