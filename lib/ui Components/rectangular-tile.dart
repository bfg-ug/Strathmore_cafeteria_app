import 'package:flutter/material.dart';

import '../model/food.dart';

class rectangularTile extends StatelessWidget {
  final Food food;
  final Function()? onTap;

  const rectangularTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        child: Image.asset(
          food.imagepath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
