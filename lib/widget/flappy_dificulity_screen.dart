import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FlappyDificulityScreen extends StatefulWidget {
  const FlappyDificulityScreen({super.key});

  @override
  State<FlappyDificulityScreen> createState() => _FlappyDificulityScreenState();
}

class _FlappyDificulityScreenState extends State<FlappyDificulityScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text("Difficiulty",style: GoogleFonts.roboto(fontWeight: FontWeight.w700,fontSize: 24),),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height*0.06,
              width: size.width*0.25,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("Easy",style: GoogleFonts.roboto(fontWeight: FontWeight.w700,fontSize: 18,color: Color(0xFFFFFFFF)),)),
            ),
            Container(
              height: size.height*0.06,
              width: size.width*0.25,
              decoration: BoxDecoration(
                  color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("Medium",style: GoogleFonts.roboto(fontWeight: FontWeight.w700,fontSize: 18,color: Color(0xFFFFFFFF)),)),
            ),
            Container(
              height: size.height*0.06,
              width: size.width*0.25,
              decoration: BoxDecoration(
                  color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("Hard",style: GoogleFonts.roboto(fontWeight: FontWeight.w700,fontSize: 18,color: Color(0xFFFFFFFF)),)),
            ),


          ],
        )
      ],
    );
  }
}
