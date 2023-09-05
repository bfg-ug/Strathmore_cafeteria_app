import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class squareTile extends StatelessWidget {
  final String item;
  final Function()? onTap;

  squareTile({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 50,
            width: 50,
            color: Colors.white,
            child: Center(child: Text(item)),
          ),
        ),
      ),
    );
  }
}
