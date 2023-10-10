import 'package:STC/global.dart';
import 'package:STC/model/shop.dart';
import 'package:STC/pages/navigation-bar%20pages/History-page.dart';
import 'package:STC/pages/navigation-bar%20pages/home-page.dart';
import 'package:STC/pages/navigation-bar%20pages/search-page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => dashboardState();
}

class dashboardState extends State<dashboard> {
  int myIndex = 0;

  final List<Widget> navbar_pages = [
    const homepage(),
    const searchpage(),
    const historypage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<shop>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              leadingWidth: 100,
              backgroundColor: appcolors.backgroundColor,
              elevation: 0,
              toolbarHeight: 80,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),

              leading: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profilepage');
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    child: Image.asset(
                      'lib/images/profile.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Profile image
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Stack(
                    children: [
                      IconButton(
                        iconSize: 40,
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                        icon: const Icon(Icons.shopping_cart_outlined),
                      ),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 12,
                          child: Text(
                            value.cart.length.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          backgroundColor: appcolors.orangeAccent,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            backgroundColor: appcolors.backgroundColor,
            body: navbar_pages[myIndex],

//Bottom navigation
            bottomNavigationBar: Container(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
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
                  selectedIconTheme: const IconThemeData(color: Colors.black),
                  unselectedIconTheme: const IconThemeData(color: Colors.grey),
                  items: const [
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
            )));
  }
}
