import 'package:STC/ui%20Components/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class historypage extends StatefulWidget {
  const historypage({super.key});

  @override
  State<historypage> createState() => _historypageState();
}

class _historypageState extends State<historypage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("My Orders",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return order_tile(
                        foodname: "beef",
                        imagepath: "lib/images/food.jpg",
                        foodprice: "100",
                        quantity: 5,
                        orderNumber: "12345",
                        status: "Complete");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
