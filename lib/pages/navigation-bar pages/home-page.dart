import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/pages/navigation-bar%20pages/search-page.dart';
import 'package:untitled1/ui%20Components/SubmitBtn.dart';
import 'package:untitled1/ui%20Components/square-tile.dart';
import 'package:untitled1/ui%20Components/vertical%20Rectangular%20tile.dart';

 class homepage extends StatefulWidget{



  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

 final List _card =[];
 final List author =[];
 final List title =[];

  @override
  Widget build(BuildContext context) {

    //This if checks if a user has inprogress courses or not
    if(_card.isEmpty || author.isEmpty || title.isEmpty){
     return Container(

      child: Center(
        child: Container(
         child: Column(
           children: [
            SizedBox(height: 50),
             Padding(
               padding: const EdgeInsets.all(10),
               child: Text("Welcome, You can have a look at  our different courses, browse through our vast online library and chat with fellow users ", style: GoogleFonts.jost( fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),),
             ),
            SizedBox(height: 25),
             Image.asset("lib/images/background.png"),
           ],
         ),
        ),

      ),);
    }else{
     return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(


       child: ListView(
        children: [

         Text("Welcome back", style: GoogleFonts.jost(
             fontSize: 30,
             fontWeight: FontWeight.bold
         ),),

         SizedBox(height: 25),


         Text("In progress", style: GoogleFonts.jost(
             fontWeight: FontWeight.w600,
             fontSize: 20
         ),),

         SizedBox(height: 25),

         Container(
          height: 300,
          child: ListView.builder(itemCount: _card.length,scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
               return verticalTile(author: author[index],
                child: _card[index],);
              }
          ),
         ),


         SizedBox(height: 25),

         Text("Watch History", style: GoogleFonts.jost(
             fontWeight: FontWeight.w600,
             fontSize: 20
         ),),

         SizedBox(height: 25),

         Container(
          height: 300,
          child: ListView.builder(itemCount: _card.length,scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
               return squareTile(author: author[index], title: title[index],);
              }
          ),
         ),
        ],
       ),
      ),
     );
    }



  }

}