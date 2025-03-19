import 'package:flutter/material.dart';
import 'package:shoes/utils/appcolor.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  AppColor.white,
      body: Column(
        children: [
          Center(child: Text("Splash Screen",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColor.appBarColor),))
        ],
      ),
    );
  }
}
