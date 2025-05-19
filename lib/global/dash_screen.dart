import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'bird.dart';
class FlappyBirds extends FlameGame with TapDetector{


  late  Birds birds;

  @override
  Future<void> onLoad()async {
    birds = Birds();
    add(birds);
  }
  @override
  void onTap() {
   birds.flap();
  }
}
