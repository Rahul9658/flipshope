import 'package:flutter/cupertino.dart';
import 'package:shoes/constant/str.dart';

import '../database/database_screen.dart';

BoxDecoration backgroundImages(String img){
  return BoxDecoration(
     image:  DecorationImage(
          image:AssetImage("assets/images/pics/$img.png"),fit:BoxFit.cover,
      ),
  );
}
// double yAxisBirds = 0;
// double birdWidth = 0.183;
// double birdHeight = 0.183;
// double barrierMovement  = 0.05;

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
void init() {
  // if (read("score") != null) {
  //   topScore = read("score");
  // } else {
  //   write("score", topScore);
  // }

  if (read("background") != null) {
    str.images = read("background");
  }
  else {
    write("background", str.images);
  }
  if (read("bird") != null) {
    str.birds = read("bird");
  } else {
    write("bird", str.birds);
  }
  // if (read("level") != null) {
  //   barrierMovement = read("level");
  // } else {
  //   write("level", barrierMovement);
  // }
  // if (read("audio") != null) {
  //   print("playyyyy:$play");
  //   play = read("audio");
  // } else {
  //   write("audio", play);
  // }
  // if (play) {
  //   player.play(AssetSource("audio/Tintin.mp3"));
  // } else {
  //   player.stop();
  // }
}

