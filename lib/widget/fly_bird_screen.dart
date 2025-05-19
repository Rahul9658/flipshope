import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/constant/background_theme.dart';
import 'package:shoes/constant/const_screen.dart';
import 'package:shoes/constant/str.dart';
import 'package:shoes/view_model/group_provider.dart' show GroupProvider;
class BirdsButtion extends StatelessWidget{
  final double height;
  final double width;
  final double yAxis;

   BirdsButtion(
     this.height,
     this.width,
     this.yAxis
       );
  
  @override
  Widget build(BuildContext context) {
    final groupProvider = context.watch<GroupProvider>();

    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(duration: const Duration(milliseconds:0 ),
      alignment: Alignment(0, (2 * yAxis + height) / (2 - width)),
      child: Image.asset(str.birds,
        height: size.height*birdHeight,
        width: size.width*birdWidth,
        fit: BoxFit.cover,

      ),
   

    );
  }

}