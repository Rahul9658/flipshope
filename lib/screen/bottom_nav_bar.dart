import 'package:flutter/material.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,  // Set your desired background color here
      selectedItemColor: Colors.black,  // Color for selected icon
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(color: Colors.black),  // Color of the label when selected
      unselectedLabelStyle: TextStyle(color: Colors.black),  // Co// Color for unselected icon
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.maps_home_work,),
          label: "Deals",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: "Shoplist",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded, ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu, ),
          label: "Menu",
        ),
      ],
    );

  }
}
