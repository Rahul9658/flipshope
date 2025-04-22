import 'package:flutter/material.dart';
import 'package:shoes/auth/login_screen.dart';
import 'package:shoes/utils/appcolor.dart';

import 'bottom_nav_bar.dart';
import 'home_sceen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     super.initState();
     Future.delayed(Duration(seconds: 5),(){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
     });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2D63DF),
      body: Center(child: Image.asset("assets/images/logo.png",width: 206,height: 177,))

    );
  }
}
