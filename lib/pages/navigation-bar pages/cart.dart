import 'package:STC/global.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/food.dart';
import '../../model/shop.dart';

class cart extends StatefulWidget {
  cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  void removeFromCart(Food food, BuildContext context) {
    final Shop = context.read()<shop>();
    Shop.removefromCart(food);
  }

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: appcolors.backgroundColor,
          elevation: 0,
          toolbarHeight: 80,
          centerTitle: true,
          title: Text("My Cart"),
        ),
        backgroundColor: appcolors.backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get food
                    final Food food = value.cart[index];

                    // get name
                    final String foodName = food.name;

                    // get price
                    final String foodPrice = food.price;

                    final String foodImage = food.imagepath;

                    // return list
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20)),
                          height: 100,
                          width: 100,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 90,
                                  width: 100,
                                  child:
                                      Image.asset(foodImage, fit: BoxFit.cover),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      foodName,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "Ksh: " + foodPrice,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text("Quantity: " + quantity.toString(),
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 120),
                              IconButton(
                                  color: Colors.white,
                                  onPressed: () =>
                                      removeFromCart(food, context),
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                  Text("Ksh: 2000",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            submitBtn(onTap: () {}, btnText: "Check out"),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
