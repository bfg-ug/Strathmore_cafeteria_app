import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:untitled1/pages/navigation-bar%20pages/chat-page.dart';
import 'package:untitled1/pages/navigation-bar%20pages/home-page.dart';
import 'package:untitled1/pages/navigation-bar%20pages/library-page.dart';
import 'package:untitled1/pages/navigation-bar%20pages/search-page.dart';
import 'package:untitled1/pages/profile-page.dart';

class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => dashboardState();
}

class dashboardState extends State<dashboard> {

  int myIndex = 0;

  final List<Widget> navbar_pages = [
    homepage(),
    searchpage(),
    librarypage(),
    chatpage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xffeae9e5),
          elevation: 0,
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),

          // Burger menu
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 35, // Changing Drawer Icon Size
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),

          // App Logo in the centre
          title: Image.asset('lib/images/Logo.png', height: 45),
          centerTitle: true,

          // Profile image
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(

                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return profile();
                  }));
                },
                child: ProfilePicture(
                  name: '',
                  radius: 25,
                  fontsize: 21,
                ),
              ),
            )
          ],
        ),

        // Sidebar / app drawer
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.7,

          child: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Container(

              child: ListView(
                children: [
                  DrawerHeader(
                      child: Center(child: Image(image: AssetImage('lib/images/Logo.png')))),


                  ListTile(
                    title: Text("Saved", style: TextStyle(fontSize: 20, color: Colors.grey),),
                    onTap: (){
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),

                  ListTile(
                    title: Text("Coaching", style: TextStyle(fontSize: 20, color: Colors.grey),),
                    onTap: (){
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),

                  ListTile(
                    title: Text("Homework", style: TextStyle(fontSize: 20, color: Colors.grey),),
                    onTap: (){
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),

                  ListTile(
                    title: Text("Payments", style: TextStyle(fontSize: 20, color: Colors.grey),),
                    onTap: (){
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),

                  ListTile(
                    title: Text("Online classes", style: TextStyle(fontSize: 20, color: Colors.grey),),
                    onTap: (){
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xffeae9e5),

body: navbar_pages[myIndex],


//Bottom navigation
        bottomNavigationBar:
        Container(

          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed ,
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
              unselectedIconTheme:  IconThemeData(color: Colors.grey),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home),
                    label: "Home",
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: "Library",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble),
                  label: "Chat",
                )
              ],
            ),
          ),
        ));
  }
}
