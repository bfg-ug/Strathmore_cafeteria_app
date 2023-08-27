import 'package:flutter/material.dart';
import 'package:untitled1/ui%20Components/SubmitBtn.dart';
import 'package:untitled1/ui%20Components/textfield.dart';

class Forgot_password extends StatelessWidget {
  Forgot_password({super.key});

  //Text editing controller to access content
  final emailController = TextEditingController();

  //Reset password function
  void resetPassword() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeae9e5),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: BackButton(

        ),
      ),

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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("Reset password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              ),

              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Enter the email associated with your account and we 'll send email with instructions to reset your password", style: TextStyle(color: Colors.grey[500]),),
              ),

              SizedBox(height: 25),

              // input for user email
              textfield(
                  controller: emailController,
                  hintText: 'example@example.com',
                  obscureText: false),
              SizedBox(height: 10),

              //Submit button
              SizedBox(height: 25),
              submitBtn(
                onTap: resetPassword, btnText: 'Send email link',
              ),


            ],
          ),
        ),
      ),




    );
  }
}
