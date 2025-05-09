import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/constant/background_theme.dart';
import 'package:shoes/constant/str.dart';

import '../widget/flappy_bird_screen.dart' show FlappyBirdScreen;
import '../widget/flappy_dificulity_screen.dart';
import '../widget/flappy_themes_screen.dart';
class FlappySettingScreen extends StatefulWidget {
  const FlappySettingScreen({super.key});
  @override
  State<FlappySettingScreen> createState() => _FlappySettingScreenState();
}
class _FlappySettingScreenState extends State<FlappySettingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async{
          Navigator.pop(context);
          return true;
       },
        child:  Scaffold(
       body: Container(
         height: size.height,
         width : size.width,
         decoration: backgroundImages(str.images),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: size.height*0.06,),
             IconButton(onPressed: () {
               Navigator.pushNamed(context, str.flappyStartScreen);
             }, icon: Icon(Icons.arrow_back)),
             SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(10),
                height: size.height*0.75,
                width: size.width,
                 decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                    Colors.grey,
                    Colors.grey.shade50,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Text("Setting",style: GoogleFonts.roboto(fontWeight: FontWeight.w700,fontSize: 24),),
                    SizedBox(height: 10,),
                    const FlappyBirdScreen(),
                    SizedBox(height: 15,),

                    const FlappyThemesScreen(),
                    SizedBox(height: 15,),
                    const FlappyDificulityScreen(),
                    SizedBox(height: 15,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, str.flappyStartScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        height: size.height*0.06,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF000000),
                        ),
                        child: Center(child: Text("Apply",style:
                        GoogleFonts.roboto(fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF)),)),
                      ),
                    )

                  ],
                ),
              ),

           ],
         ),
       ),
     ),
    );
  }
}
