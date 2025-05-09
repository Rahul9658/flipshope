import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/routie/my_routes.dart';
import 'onboard_screen.dart';
class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});
  @override
  State<SplashScreen1> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen1> {
   @override
  void initState() {
     Future.delayed(Duration(seconds: 10), (){
       Navigator.pushNamed(context, appRoutes.onboardScreen);
     });
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body:
      Center(child: IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.spotify,size: 90,color: Colors.green,))),
    );
  }
}
