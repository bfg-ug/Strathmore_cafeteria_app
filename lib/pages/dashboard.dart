import 'package:STC/global.dart';
import 'package:STC/model/shop.dart';
import 'package:STC/pages/navigation-bar%20pages/History-page.dart';
import 'package:STC/pages/navigation-bar%20pages/home-page.dart';
import 'package:STC/pages/navigation-bar%20pages/search-page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => dashboardState();
}

class dashboardState extends State<dashboard> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final controller = PageController(
    initialPage: 0,
  );
  int myIndex = 0;

  var navbar_pages = [
    const homepage(),
    const searchpage(),
    const historypage()
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Consumer<shop>(
        builder: (context, value, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leadingWidth: 100,
              backgroundColor: appcolors.backgroundColor,
              elevation: 0,
              toolbarHeight: 100,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),

              leading: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profilepage');
                },
                child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(currentUser.uid)
                      .snapshots(),
                  builder: (context, snapshots) {
                    if (snapshots.hasData) {
                      final userData =
                          snapshots.data!.data() as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/profilepage');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                child: Image.network(
                                  '${userData['Profile image']}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (snapshots.hasError) {
                      return Center(
                        child: Text('Error${snapshots.error}'),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),

              // Shopping cart
              actions: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Stack(
                    children: [
                      IconButton(
                        iconSize: 35,
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                        icon: const Icon(Icons.shopping_cart_outlined),
                      ),
                      if (value.cart.isNotEmpty) ...[
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            radius: 11,
                            child: Text(
                              value.cart.length.toString(),
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            backgroundColor: appcolors.orangeAccent,
                          ),
                        )
                      ]
                    ],
                  ),
                )
              ],
            ),
            backgroundColor: appcolors.backgroundColor,
            // body: navbar_pages[myIndex],

            body: PageView(
              controller: controller,
              children: navbar_pages,
              onPageChanged: (index) {
                setState(() {
                  myIndex = index;
                });
              },
            ),

//Bottom navigation
            bottomNavigationBar: ClipRRect(
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
                    controller.animateToPage(myIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
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
                    label: "Orders",
                  ),
                ],
              ),
            )));
  }
}
