import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:shoes/database/database_screen.dart' show write;
class GroupProvider extends ChangeNotifier {
  double yAxis = 0;
  double time = 0;
  double initialHeight = 0;
  bool gameHasStarted = false;
  double height = 0;
  double gravity = -3.5;
  double velocity = 0;
  bool barrierPassed0 = false;
  bool barrierPassed1 = false;
  double barrierMovement = 0.05;
  double birdWidth = 0.183;
  double birdHeight = 0.183;
  int score = 0;
  int topScore = 0;
  List<double> barrierX = [2, 4];
  double barrierWidth = 0.4;
  List<List<double>> barrierHeight = [
    [0.6, 0.4],
    [0.4, 0.6],
  ];
  double screenEnd = -1.9;
  double screenStart = 3.5;


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
        notifyListeners();
      } else {
        barrierX[0] -= barrierMovement;
        if (!barrierPassed0 && barrierX[0] < birdWidth - barrierWidth) {
          if (!birdIsDead()) {
            barrierPassed0 = true;
            score++;
            notifyListeners();
            if (score > topScore) {
              topScore = score;
            }
          }
        }
      }

      if (barrierX[1] < screenEnd) {
        barrierX[1] += screenStart;
        barrierPassed1 = false;
        notifyListeners();
      } else {
        barrierX[1] -= barrierMovement;

        // Check if bird passed this barrier
        if (!barrierPassed1 && barrierX[1] < birdWidth - barrierWidth) {
          if (!birdIsDead()) {
            barrierPassed1 = true;

            score++;
            notifyListeners();
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


}


