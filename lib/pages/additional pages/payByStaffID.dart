import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui Components/SubmitBtn.dart';
import '../../ui Components/textfield.dart';

class paybyStaffID extends StatefulWidget {
  const paybyStaffID({super.key});

  @override
  State<paybyStaffID> createState() => _paybyStaffIDState();
}

class _paybyStaffIDState extends State<paybyStaffID> {
  dynamic payByID() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Confirm payment"),
              content: Container(
                height: 120,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Full name: "),
                        Text("Name"),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User Type: "),
                        Text("Type"),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price: "),
                        Text("Price"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                          "Do you confirm payment for the above stated amount"),
                    ),
                  ],
                ),
              ),
              actions: [
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Confirm"),
                        ))),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Cancel"),
                        ))),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors.backgroundColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      backgroundColor: appcolors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 75),
            Text(
              "Student/Staff ID",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            Image.asset("lib/images/Card.png"),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Enter ID number",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const textfield(hintText: "123456", obscureText: false),
            const SizedBox(height: 25),
            submitBtn(onTap: payByID, btnText: "Pay")
          ],
        ),
      ),
    );
  }
}
