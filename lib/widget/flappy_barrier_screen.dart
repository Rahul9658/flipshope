import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shoes/constant/const_screen.dart';

class Barrier extends StatelessWidget{

  final double barrierHeight;
  final double barrierWidth;
  final bool isTop;
  final double direction;

  Barrier(
     this.barrierHeight,
     this.barrierWidth,
     this.isTop,
     this.direction
      );
  @override
  Widget build(BuildContext context){
    Size  size = MediaQuery.of(context).size;
    return AnimatedContainer(duration: Duration(microseconds: 0),
      alignment: Alignment(direction, isTop ? 1.1 : -1.1),
      child: Container(
        height: (size.height) / ( 4 * barrierHeight) / 2,
        width: size.width*barrierWidth/2,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 227, 223, 223),
          border:
          Border.all(width: 5, color: Color.fromARGB(255, 207, 204, 204)),
          borderRadius: BorderRadius.circular(16),        ),
      ),

    );
  }

}