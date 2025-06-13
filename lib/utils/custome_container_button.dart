import 'package:flutter/material.dart';
class CustomeButton extends StatelessWidget{
  final double  height;
  final double width;
  final Widget child;
  final Color? color;

  const CustomeButton({super.key,
    required this.height,
    required this.width,
    required this.child,
     this.color,
  });
  @override
  Widget build(BuildContext context) {
   return Container(
     height: height,
     width: width,
     decoration:  BoxDecoration(
       color: color,
       borderRadius: BorderRadius.circular(10),
     ),
     child: child,
   );
  }

}