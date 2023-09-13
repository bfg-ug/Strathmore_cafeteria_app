import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    String school = "Daffodils";
    String userEmail = "example@example.com";
    return Scaffold(
      backgroundColor: const Color(0xffeae9e5),
      appBar: AppBar(
        backgroundColor: const Color(0xffeae9e5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.jost(fontSize: 25, color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  child: const ProfilePicture(
                    name: '',
                    radius: 80,
                    fontsize: 21,
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
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

  editprofile() {}

  deleteAccount() {}
}
