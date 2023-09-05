import 'package:flutter/material.dart';

class rectangularTile extends StatelessWidget {
  final String imagePath;

  rectangularTile({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          elevation: 50,
          child: Container(
            width: 350,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
