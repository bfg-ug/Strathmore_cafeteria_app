import 'package:STC/global.dart';
import 'package:STC/ui%20Components/SubmitBtn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/food.dart';
import '../../model/shop.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    int total = 0;
    int quantity = 1;

    return Consumer<shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: appcolors.backgroundColor,
          elevation: 0,
          toolbarHeight: 80,
          centerTitle: true,
          title: const Text("My Cart"),
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
                    final int foodPrice = food.price;

                    final String foodImage = food.imagepath;

                    // return list
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: appcolors.blueAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: SizedBox(
                                        height: 90,
                                        width: 100,
                                        child: Image.asset(foodImage,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // food name
                                        Text(
                                          foodName,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),

                                        // food price
                                        Text(
                                          "Ksh: $foodPrice",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),

                                        // food quantity
                                        Text("Quantity: $quantity",
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                  color: Colors.white,
                                  onPressed: () =>
                                      Provider.of<shop>(context, listen: false)
                                          .removefromCart(food),
                                  icon: const Icon(Icons.delete))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            // Total row
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
                  Text("Ksh: " + value.total().toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),

            //Checkout Button
            submitBtn(
                onTap: () {
                  Navigator.pushNamed(context, '/paymentSelection');
                },
                btnText: "Check out"),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
