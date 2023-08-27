import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class verticalTile extends StatelessWidget{

  final String child;
  final String author;

  verticalTile({required this.child, required this.author});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 300,
          width: 200,
          child: Stack(
            children: [
              Container(
                height: 300,
                width: 250,
                color: Colors.grey,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 200,
                  alignment: Alignment(0,0.85),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white30,
                    value: 0.7,


                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  alignment: Alignment(-0.8, 0.35),
                  width: 120,
                  child: Text(author, style: GoogleFonts.jost(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  alignment: Alignment(-0.8, 0.65),
                  width: 120,
                  child: Text(child, style: GoogleFonts.jost(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                  ),),
                ),
              )
            ],
          )
        ),
      ),
    );
  }

}