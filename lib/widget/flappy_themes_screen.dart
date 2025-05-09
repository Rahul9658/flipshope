import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/constant/background_theme.dart';

import '../constant/str.dart';
import '../database/database_screen.dart';
class FlappyThemesScreen extends StatefulWidget {
  const FlappyThemesScreen({super.key});
  @override
  State<FlappyThemesScreen> createState() => _FlappyThemesScreenState();
}
class _FlappyThemesScreenState extends State<FlappyThemesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin:  EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Text("Theme",style: GoogleFonts.roboto(fontSize: 24,fontWeight: FontWeight.w700),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    str.images = "0";
                    write("background", str.images);
                    backgroundImages(str.images);
                  },
                  child: Image.asset("assets/images/pics/0.png",
                    height: 70,
                    width: 70,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    str.images = "1";
                    write("background", str.images);
                    backgroundImages(str.images);
                  },
                  child: Image.asset("assets/images/pics/1.png",
                    height: 70,
                    width: 70,
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    str.images = "2";
                    write("background", str.images);
                    backgroundImages(str.images);
                  },
                  child: Image.asset("assets/images/pics/2.png",
                    height: 70,
                    width: 70,
                  ),
                ),
              ],
            )

          ],
        ),
      );

  }
}
