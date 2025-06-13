import 'package:flutter/material.dart';
import 'package:shoes/ui/fetch_data.dart';
class BottomNavagationBar extends StatefulWidget {
  const BottomNavagationBar({super.key});

  @override
  State<BottomNavagationBar> createState() => _BottomNavagationBarState();
}

class _BottomNavagationBarState extends State<BottomNavagationBar> {
  List<Widget> tabScreen =  [
    FetchData(email: '',),
    ];
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: tabScreen[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          onTap: (value){

          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.indigo,
          elevation: 10,
        ),


    );
  }
}
