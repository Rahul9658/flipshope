import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/constant/background_theme.dart';
class Buttion extends StatelessWidget{
   final double height;
   final double width;
   final String page;
   final String buttionType;
   final Icon? icon;
  const Buttion({
    super.key,
    required this.height,
    required this.width,
    required this.page,
    required this.buttionType,
    this.icon
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade500],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter
          ),
        ),
        alignment: Alignment.center,
        child: buttionType == "text" ?Text("Play",style:
        GoogleFonts.roboto(fontSize: 30,
            fontWeight: FontWeight.w600,color:
            Colors.green),):icon
      ),
      onTap: (){
          navagater(context, page);

      },
    );
  }
}