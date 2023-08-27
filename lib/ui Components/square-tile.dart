import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class squareTile extends StatelessWidget{

  final String author;
  final String title;


  squareTile({required this.author, required this.title});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 200,
          width: 150,
          child: Column(
            children: [
              
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 100,
                  width: 150,
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 150,
                child: Text(author, style: GoogleFonts.jost(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey
                ),),
              ),
              Container(
                width: 150,
                child: Text(title, style: GoogleFonts.jost(
                    fontSize: 15,
                  fontWeight: FontWeight.w600
                ),),
              )

            ],
          ),
        ),
      ),
    );
  }

}