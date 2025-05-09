import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart' show Hive;
import 'package:shoes/constant/background_theme.dart';
import 'package:shoes/constant/str.dart';
import 'package:shoes/widget/fly_bird_screen.dart' show BirdsButtion;

import '../widget/buttion_widget.dart';
class FlappyStartScreen extends StatefulWidget {
  const FlappyStartScreen({super.key});

  @override
  State<FlappyStartScreen> createState() => _FlappyStartScreenState();
}
class _FlappyStartScreenState extends State<FlappyStartScreen> {
  var valueBox = Hive.box('user');

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop:() async{
          return true;
        },
      child:  Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: backgroundImages(str.images),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height*0.25,),
              Text("FlappyBird",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 40,color: const Color(0xFFFFFFFF)),),
              const SizedBox(height: 50,),

              BirdsButtion( yAxisBirds , birdHeight, birdWidth),
              _buttion(),
            ],
          ),
        ),
      ),

    );
  }
  Widget _buttion(){
    return const Column(
      children: [
        Buttion(
          height: 60,
          width: 247,
          buttionType: "text",
          page:str.games,
          icon: Icon(Icons.play_arrow),
        ),
        SizedBox(height: 30,),
         Buttion(
            height: 60,
            width: 120,
            page: str.setting,
            buttionType: "icon",
          icon: Icon(Icons.settings,size: 40,),
        ),
      ],
    );
  }
}
