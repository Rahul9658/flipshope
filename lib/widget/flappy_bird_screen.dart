import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/background_theme.dart';
import '../constant/str.dart';
import '../database/database_screen.dart';
class FlappyBirdScreen extends StatefulWidget {
  const FlappyBirdScreen({super.key});

  @override
  State<FlappyBirdScreen> createState() => _FlappyBirdScreenState();
}

class _FlappyBirdScreenState extends State<FlappyBirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Birds",style: GoogleFonts.roboto(fontWeight: FontWeight.w700,fontSize: 24),),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             GestureDetector(
               onTap: (){
                 str.birds = "assets/images/pics/blue.png";
                 write("bird", str.birds);
               },
                 child: Image.asset("assets/images/pics/blue.png",height: 75,width: 75,)),

             GestureDetector(
               onTap: (){
                 str.birds = "assets/images/pics/green.png";
                 write("bird", str.birds);
               },
                 child: Image.asset("assets/images/pics/green.png",height: 75,width: 75,)),

             GestureDetector(onTap:(){
               str.birds = "assets/images/pics/bird.png";
               write("bird", str.birds);
             },
                 child: Image.asset("assets/images/pics/bird.png",height: 75,width: 75,)),
          ],
        )



      ],
    );
  }
}
