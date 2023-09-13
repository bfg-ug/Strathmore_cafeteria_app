import 'package:flutter/material.dart';
import 'package:STC/global.dart';
import 'package:STC/pages/additional%20pages/password-reset.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/textfield.dart';

class otpCheck extends StatefulWidget {
  const otpCheck({super.key});

  @override
  State<otpCheck> createState() => _otpCheckState();
}

class _otpCheckState extends State<otpCheck> {
  //Text editing controller to access content
  final emailController = TextEditingController();

  //Reset password function
  void verifyOTP() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const resetPassword();
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
                  "Enter OTP",
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
                  hintText: '',
                  obscureText: false),
              const SizedBox(height: 10),

              //Submit button
              const SizedBox(height: 25),
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
