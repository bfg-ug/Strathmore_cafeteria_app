import 'package:STC/global.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:STC/ui%20Components/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../utility.dart';

class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  final _lastnameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  void dispose() {
    _lastnameController.dispose();
    _firstnameController.dispose();
    super.dispose();
  }

  Future deleteAccount() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Confirmation"),
              content: const Text(
                  "By clicking you are confirming that you wish to delete your account and all subsequent data related to the account"),
              actions: [
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Confirm"),
                        ))),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Cancel"),
                        ))),
              ],
            ));
  }

  Future updateAccount() async {
    if (_firstnameController.text.trim().isNotEmpty) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({
        "First name": _firstnameController.text.trim(),
      });

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text("Your profile has been updated"),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.done))
                ],
              ));
    } else if (_lastnameController.text.trim().isNotEmpty) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({
        "Last name": _lastnameController.text.trim(),
      });
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                content: Text("No changes were made to your account"),
              ));
    }
  }

  void selectImage() async {
    // await pickImage(ImageSource.gallery);

    await updatePhoto(ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appcolors.backgroundColor,
      appBar: AppBar(
        backgroundColor: appcolors.backgroundColor,
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Edit",
          style: GoogleFonts.poppins(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            final userData = snapshots.data!.data() as Map<String, dynamic>;
            return Container(
              decoration: BoxDecoration(
                color: appcolors.backgroundColor,
              ),
              child: Column(
                children: [
                  Stack(children: [
                    if (userData['Profile image'] != null) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.red,
                          child: Image.network(
                            '${userData['Profile image']}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ] else ...[
                      Image.asset(
                        'lib/images/profile.png',
                        fit: BoxFit.contain,
                        height: 150,
                      ),
                    ],
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: appcolors.orangeAccent,
                        ),
                        child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(Icons.add_a_photo_outlined)),
                      ),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Update Personal profile",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: textfield(
                              controller: _firstnameController,
                              hintText: userData['First name'],
                              obscureText: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: textfield(
                              controller: _lastnameController,
                              hintText: userData['Last name'],
                              obscureText: false),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: submitBtn(onTap: updateAccount, btnText: "Update"),
                  ),
                  Text(
                    "Or",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      child: GestureDetector(
                        onTap: deleteAccount,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              "Delete accunt",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (snapshots.hasError) {
            return Center(
              child: Text('Error${snapshots.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
