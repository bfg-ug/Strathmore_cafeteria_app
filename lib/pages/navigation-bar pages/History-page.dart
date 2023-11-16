import 'dart:developer';

import 'package:STC/model/pets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/shop.dart';
import '../../ui Components/order_tile.dart';

class historypage extends StatefulWidget {
  const historypage({super.key});

  @override
  State<historypage> createState() => _historypageState();
}

class _historypageState extends State<historypage> {
  @override
  void initState() {
    Provider.of<shop>(context, listen: false).getDatafromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('build called');
    return Consumer<shop>(
        builder: (context, value, child) => value.isloading
            ? getLoadingUI()
            : value.error.isNotEmpty
                ? getErrorUI(value.error)
                : getBodyUI(value.pets));
  }

  getLoadingUI() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  getErrorUI(String error) {
    return Center(
      child: Text(error),
    );
  }

  getBodyUI(Pets pets) {
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
                  itemCount: pets.data.length,
                  itemBuilder: (context, index) {
                    return order_tile(
                        foodname: pets.data[index].petName,
                        imagepath: pets.data[index].petImage,
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
    // return ListView.builder(
    //     itemCount: pets.data.length,
    //     itemBuilder: (context, index) => ListTile(
    //           title: Text(pets.data[index].userName),
    //         ));
  }
}
