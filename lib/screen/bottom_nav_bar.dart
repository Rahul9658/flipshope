import 'package:flutter/material.dart';
import 'package:shoes/screen/home_sceen.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> tabscreen = [
    const HomeSceen(),
    const HomeSceen(),
    const HomeSceen(),
    const HomeSceen(),
    const HomeSceen(),
  ];
  int selectIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabscreen[selectIndex],

      bottomNavigationBar: BottomNavigationBar(
           onTap: (value){
             setState(() {
               selectIndex=value;
             });
           },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,  // Set your desired background color here
        selectedItemColor: const Color(0xFF2158D7),  // Color for selected icon
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.black),  // Color of the label when selected
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        currentIndex: selectIndex,// Co// Color for unselected icon
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.maps_home_work,),
            label: "Deals",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: "Shoplist",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded, ),
            label: "Search",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.paste_rounded, ),
            label: "Coupons",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu, ),
            label: "Menu",
          ),
        ],
      ),
    );

  }
}
