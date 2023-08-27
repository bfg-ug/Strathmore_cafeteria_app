import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/ui%20Components/textfield.dart';

import '../../ui Components/square-tile.dart';

class searchpage extends StatefulWidget{
  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {

  final List _card =["Hello","Hello","Hello","Hello"];
  final List author =["Hello","Hello","Hello","Hello"];
  final List title =["Hello","Hello","Hello","Hello"];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Expanded(
          child: ListView(
            children: [
              SizedBox(height: 25),
              textfield(hintText: "Search", obscureText: false),

              SizedBox(height: 25),
              Text("Popular courses", style: GoogleFonts.jost(
                  fontWeight: FontWeight.w600,
                  fontSize: 20
              ),),

              Container(
                height: 200,
                child: ListView.builder(itemCount: _card.length,scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return squareTile(author: author[index], title: title[index],);
                    }
                ),
              ),
              
            ],
          ),
        ),


      ),
    );
  }
}