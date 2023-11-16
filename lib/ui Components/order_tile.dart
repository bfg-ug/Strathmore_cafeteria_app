import 'package:STC/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class order_tile extends StatefulWidget {
  final String foodname;
  final String imagepath;
  final String foodprice;
  final int quantity;
  final String orderNumber;
  final String status;

  order_tile(
      {super.key,
      required this.foodname,
      required this.imagepath,
      required this.foodprice,
      required this.quantity,
      required this.orderNumber,
      required this.status});

  @override
  State<order_tile> createState() => _order_tileState();
}

class _order_tileState extends State<order_tile> {
  @override
  Widget build(BuildContext context) {
    double percent = 0.33;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
              color: appcolors.blueAccent,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("#Order Number: ",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                    Text(widget.orderNumber,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 90,
                        width: 100,
                        child:
                            Image.network(widget.imagepath, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // food name
                        Text(
                          widget.foodname,
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),

                        // food price
                        Text(
                          "Ksh: ${widget.foodprice}",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),

                        // food quantity
                        Text("Quantity: ${widget.quantity}",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Status: ",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  Column(
                    children: [
                      Text(widget.status,
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: LinearPercentIndicator(
                          animation: true,
                          width: 150.0,
                          lineHeight: 10.0,
                          percent: percent,
                          backgroundColor: Colors.grey,
                          progressColor: appcolors.orangeAccent,
                          barRadius: Radius.circular(50),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
