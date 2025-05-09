import 'package:flutter/material.dart';
import 'package:shoes/page/flappy_start_screen.dart' show FlappyStartScreen;
class FlappySplashScreen extends StatefulWidget {
  const FlappySplashScreen({super.key});

  @override
  State<FlappySplashScreen> createState() => _FlappySplashScreenState();
}

class _FlappySplashScreenState extends State<FlappySplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 10),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const FlappyStartScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
        body: Center(child: Image.asset("assets/images/pics/icon.png",height: 120,width: 120,)),
    );
  }
}
