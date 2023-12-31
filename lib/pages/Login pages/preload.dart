import 'package:STC/pages/Login.dart';
import 'package:STC/pages/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class preload extends StatelessWidget {
  const preload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const dashboard();
            } else {
              return const Login();
            }
          }),
    );
  }
}
