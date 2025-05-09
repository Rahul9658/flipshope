import 'package:flutter/cupertino.dart';
import 'package:shoes/constant/str.dart';

BoxDecoration backgroundImages(String img){
  return BoxDecoration(
     image:  DecorationImage(
          image:AssetImage("assets/images/pics/$img.png"),fit:BoxFit.cover,
      ),
  );
}
double yAxisBirds = 0;
double birdWidth = 0.183;
double birdHeight = 0.183;
void navagater(context , navagation){
  switch(navagation){
    case str.games:
      Navigator.pushNamed(context, str.games);
      break;
    case str.setting:
      Navigator.pushNamed(context, str.setting);
      break;

  }
}