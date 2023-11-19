import 'package:STC/global.dart';
import 'package:STC/ui%20Components/timeline_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class order_timeline extends StatefulWidget {
  order_timeline({super.key});
  @override
  State<order_timeline> createState() => _order_timelineState();
}

class _order_timelineState extends State<order_timeline> {
  String packing_status = "Order Placed";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.backgroundColor,
      appBar: AppBar(
        backgroundColor: appcolors.backgroundColor,
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Order Detail",
          style: GoogleFonts.poppins(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            //Start timeline

            //Order placed
            myTimelineTile(
              isFirst: true,
              isLast: false,
              isPast: true,
              child: "Order Placed",
            ),

            //Order packing
            myTimelineTile(
              isFirst: false,
              isLast: false,
              isPast: packing_status == "packing" ? true : false,
              child: "Packing Order",
            ),

            //Order Ready
            myTimelineTile(
              isFirst: false,
              isLast: false,
              isPast: packing_status == "pickup" ? true : false,
              child: "Ready for pick up",
            ),

            //Order done
            myTimelineTile(
              isFirst: false,
              isLast: true,
              isPast: packing_status == "complete" ? true : false,
              child: "Complete",
            )
          ],
        ),
      ),
    );
  }
}
