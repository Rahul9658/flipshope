import 'package:flutter/material.dart';
class CustomeButton extends StatelessWidget{
  final double  height;
  final double width;
  final Widget child;

  const CustomeButton({super.key,
    required this.height,
    required this.width,
    required this.child
  });
  @override
  Widget build(BuildContext context) {
   return Container(
     height: height,
     width: width,
     decoration:  BoxDecoration(
       color: Color(0xFF2D63DF),
       borderRadius: BorderRadius.circular(10),
     ),
     child: child,
   );
  }

}