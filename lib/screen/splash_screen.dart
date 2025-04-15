import 'package:flutter/material.dart';
import 'package:shoes/auth/login_screen.dart';
import 'package:shoes/utils/appcolor.dart';
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
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
     });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  AppColor.white,
      body: Column(
        children: [
          SizedBox(height: 200,),
          Center(child: Text("Splash Screen",
            style: TextStyle(fontWeight: FontWeight.w600,
                fontSize: 18,color: AppColor.appBarColor),
          )),
        ],
      ),
    );
  }
}
