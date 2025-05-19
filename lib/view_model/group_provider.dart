import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoes/constant/const_screen.dart';
import 'package:shoes/database/database_screen.dart' show write;
class GroupProvider extends ChangeNotifier {

  bool barrierPassed0 = false;
  bool barrierPassed1 = false;

  void jump() {
    time = 0;
    initialHeight = yAxis;
    notifyListeners();
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 35), (timer) {
      height = gravity * time * time + velocity * time;
      yAxis = initialHeight - height;
      if (barrierX[0] < screenEnd) {
        barrierX[0] += screenStart;
        barrierPassed0 = false;
      } else {
        barrierX[0] -= barrierMovement;
        if (!barrierPassed0 && barrierX[0] < birdWidth - barrierWidth) {
          if (!birdIsDead()) {
            barrierPassed0 = true;
            score++;
            if (score > topScore) {
              topScore = score;
            }
          }
        }
      }

      if (barrierX[1] < screenEnd) {
        barrierX[1] += screenStart;
        barrierPassed1 = false;
      } else {
        barrierX[1] -= barrierMovement;

        if (!barrierPassed1 && barrierX[1] < birdWidth - barrierWidth) {
          if (!birdIsDead()) {
            barrierPassed1 = true;

            score++;
            if (score > topScore) {
              topScore = score;
            }
          }
        }
      }

      if (birdIsDead()) {
        timer.cancel();
        write("score", topScore);
        // _showDialog();
      }

      time += 0.032;
    });

      notifyListeners();
  }




  bool birdIsDead() {
    if (yAxis > 1.26 || yAxis < -1.1) {
      return true;
      }
    for (int i = 0; i < barrierX.length; i++) {
      if(barrierX[i]<=birdWidth &&
          (barrierX[i] + (barrierWidth)) >= birdWidth &&
          (yAxis <= -1 + barrierHeight[i][0] ||
              yAxis + birdHeight >= 1 - barrierHeight [i][1] )

         )
      {
        return true;
      }

    }
    return false;
  }
  void resetGame() {
      yAxis = 0;
      gameHasStarted = false;
      time = 0;
      score = 0;
      initialHeight = yAxis;
      barrierX[0] = 2;
      barrierX[1] = 3.4;

      notifyListeners();

  }
  TextEditingController nameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<dynamic> addFirebaseMessages() async{
   FirebaseFirestore.instance.collection('tester').add({
     'name' : nameController.text,
     'fullName' :fullNameController.text,
     'email' : emailController.text,
     'password' : passwordController.text,

   });
   Fluttertoast.showToast(msg: "recived data successfully");

  }






}


