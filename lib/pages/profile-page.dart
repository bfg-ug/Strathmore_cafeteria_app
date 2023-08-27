import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/ui%20Components/SubmitBtn.dart';

class profile extends StatefulWidget{


  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  

  @override
  Widget build(BuildContext context) {
    String school ="Daffodils";
    String user_email = "example@example.com";
    return Scaffold(
        backgroundColor: Color(0xffeae9e5),

      appBar: AppBar(
        backgroundColor: Color(0xffeae9e5),
        elevation: 0,

        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),

      title: Text("Profile", style: GoogleFonts.jost(
        fontSize: 25,
        color: Colors.grey
      ),),
        centerTitle: true,
      ),

      body: Column(

        children: [


          SizedBox(height: 50),


          Center(child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                child: ProfilePicture(
                  name: '',
                  radius: 80,
                  fontsize: 21,
                ),
              ),
              SizedBox(height: 10, width: 10,
              child: Container(
                color: Colors.orangeAccent,
              ),
              )
            ],

          ),
          ),



        ],
      ),


    );
  }

  editprofile() {
  }

  deleteAccount() {
  }
}