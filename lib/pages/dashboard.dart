import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:untitled1/global.dart';
import 'package:untitled1/pages/navigation-bar%20pages/home-page.dart';
import 'package:untitled1/pages/navigation-bar%20pages/History-page.dart';
import 'package:untitled1/pages/navigation-bar%20pages/search-page.dart';
import 'package:untitled1/pages/profile-page.dart';

class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => dashboardState();
}

class dashboardState extends State<dashboard> {
  int myIndex = 0;

  final List<Widget> navbar_pages = [homepage(), searchpage(), historypage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: appcolors.backgroundColor,
          elevation: 0,
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),

          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: ProfilePicture(
              name: 'Fareed Matovu',
              radius: 40,
              fontsize: 21,
            ),
          ),

          // Profile image
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: IconButton(
                iconSize: 40,
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            )
          ],
        ),
        backgroundColor: appcolors.backgroundColor,
        body: navbar_pages[myIndex],

//Bottom navigation
        bottomNavigationBar: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              onTap: (index) {
                setState(() {
                  myIndex = index;
                });
              },
              currentIndex: myIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: IconThemeData(color: Colors.black),
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: "History",
                ),
              ],
            ),
          ),
        ));
  }
}
