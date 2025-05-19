import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

import '../constant/config.dart' show barrierX1, barrierX2, barrierY1, barrierY2, gravity, jumpStrength, velocity;

class Birds extends SpriteComponent{

  Birds() :super(position: Vector2(barrierX1, barrierY1), size: Vector2(barrierX2 , barrierY2));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('green.png');
  }

void flap() {
  velocity =jumpStrength;
}
@override
  void update(double dt) {
  velocity += gravity * dt;
  position.y += velocity * dt;
  }



}