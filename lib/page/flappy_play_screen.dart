import 'package:flutter/material.dart';
import 'package:shoes/constant/background_theme.dart';
import 'package:shoes/constant/str.dart';
class FlappyPlayScreen extends StatefulWidget {
  const FlappyPlayScreen({super.key});
  @override
  State<FlappyPlayScreen> createState() => _FlappyPlayScreenState();
}
class _FlappyPlayScreenState extends State<FlappyPlayScreen> {
  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop:()async {
         return true;

         },
        child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: backgroundImages(str.images),
          child: Column(
            children: [

            ],
          ),
        ),
      ),


    );
  }
}
