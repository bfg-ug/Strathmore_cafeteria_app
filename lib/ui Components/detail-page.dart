import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/food.dart';
import '../model/shop.dart';
import 'SubmitBtn.dart';

class DetailScreen extends StatefulWidget {
  final Datum food;

  const DetailScreen({super.key, required this.food});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 0;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  void addToCart() {
    if (quantity > 0) {
      final Shop = context.read<shop>();
      Shop.addtoCart(widget.food, quantity);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text("Successfully added to cart"),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.done))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appcolors.backgroundColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: appcolors.backgroundColor,
          elevation: 0,
          toolbarHeight: 80,
        ),
        body: ListView(
          children: [
            // image
            Container(
              child: Image.asset(
                widget.food.imagepath,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                //title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "lib/images/star.svg",
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "5",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(widget.food.name,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum, corrupti quos. Numquam aspernatur, quibusdam doloribus natus dolor ullam exercitationem optio.",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        )),
                  ),
                ),
                const SizedBox(height: 25),
                // Quantity and price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: increaseQuantity,
                      child: SvgPicture.asset(
                        "lib/icons/plus.svg",
                        height: 30,
                        width: 30,
                        color: appcolors.orangeAccent,
                      ),
                    ),
                    Text(quantity.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white)),
                    GestureDetector(
                      onTap: decreaseQuantity,
                      child: SvgPicture.asset(
                        "lib/icons/minus.svg",
                        height: 30,
                        width: 30,
                        color: appcolors.orangeAccent,
                      ),
                    ),
                    Text("Ksh: ${widget.food.price}",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white)),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                //Add to cart button
              ],
            ),
            submitBtn(
              onTap: addToCart,
              btnText: 'Add to Cart',
            ),
          ],
        ));
  }
}
