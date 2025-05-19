// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, avoid_print
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/constant/background_theme.dart';
import 'package:shoes/view_model/group_provider.dart';
import '../constant/const_screen.dart';
import '../constant/str.dart';
import '../database/database_screen.dart';
import '../widget/flappy_barrier_screen.dart';
import '../widget/fly_bird_screen.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);
  @override
  State<GamePage> createState() => _GamePageState();
}
class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    final groupProvider = context.watch<GroupProvider>();
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration:backgroundImages(str.images),
              child: Stack(
                children: [
                  BirdsButtion(yAxis, birdWidth, birdHeight),
                  // Tap to play text
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: Text(
                        gameHasStarted ? '' : 'TAP TO START', style: TextStyle(color:Colors.white),),
                  ),
                  Barrier(barrierHeight[0][0], barrierWidth, true,barrierX[0], ),
                  Barrier(
                      barrierHeight[0][1], barrierWidth,false, barrierX[0]),
                  Barrier(barrierHeight[1][0], barrierWidth, true, barrierX[1],),
                  Barrier(
                      barrierHeight[1][1], barrierWidth, false, barrierX[1]),
                  Positioned(
                    top: 35,
                    right: 15,
                    left: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Score : $score",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 30,
                                fontFamily: "04B_19__"),
                          ), // Best TEXT
                          // Text("Best : $topScore",
                          //     style: TextStyle(
                          //         color: Colors.yellow,
                          //         fontSize: 30,
                          //         fontFamily: "04B_19__")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Cover(),
          // ),
        ]),
      ),
    );
  }

  // Jump Function:
  void jump() {
    setState(() {
      time = 0;
      initialHeight = yAxis;
    });
  }
  
  bool barrierPassed0 = false;
  bool barrierPassed1 = false;

// In your startGame function, modify the main game loop
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 35), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        yAxis = initialHeight - height;
      });

      /* <  Barriers Movements  > */
      setState(() {
        if (barrierX[0] < screenEnd) {
          barrierX[0] += screenStart;
          // Reset the passed flag when barrier resets
          barrierPassed0 = false;
        } else {
          barrierX[0] -= barrierMovement;

          // Check if bird passed this barrier
          if (!barrierPassed0 && barrierX[0] < birdWidth - barrierWidth) {
            if (!birdIsDead()) {
              barrierPassed0 = true;
              setState(() {
                score++;
                if (score > topScore) {
                  topScore = score;
                }
              });
            }
          }
        }
      });
      setState(() {
        if (barrierX[1] < screenEnd) {
          barrierX[1] += screenStart;
          barrierPassed1 = false;
        } else {
          barrierX[1] -= barrierMovement;
          if (!barrierPassed1 && barrierX[1] < birdWidth - barrierWidth) {
            if (!birdIsDead()) {
              barrierPassed1 = true;
              setState(() {
                score++;
                if (score > topScore) {
                  topScore = score;
                }
              });
            }
          }
        }
      });

      if (birdIsDead()) {
        timer.cancel();
        write("score", topScore);
        _showDialog();
      }

      time += 0.032;
    });

    // Remove the score timer completely
  }

  /// Make sure the [Bird] doesn't go out screen & hit the barrier
  bool birdIsDead() {
    // Screen
    if (yAxis > 1.26 || yAxis < -1.1) {
      return true;
    }

    /// Barrier hitBox
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          (barrierX[i] + (barrierWidth)) >= birdWidth &&
          (yAxis <= -1 + barrierHeight[i][0] ||
              yAxis + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    Navigator.pop(context); // dismisses the alert dialog
    setState(() {
      yAxis = 0;
      gameHasStarted = false;
      time = 0;
      score = 0;
      initialHeight = yAxis;
      barrierX[0] = 2;
      barrierX[1] = 3.4;
    });
  }
  // TODO: Alert Dialog with 2 options (try again, exit)
  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: Text("..Oops", style: TextStyle(fontSize: 35,color: Colors.blue[900]),),
          actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Score : $score",style: TextStyle(color:  Colors.blue[900],fontSize: 20),),
                    Text("Best : $score",style: TextStyle(color:  Colors.blue[900],fontSize: 20),),
                  ],
                ),
                SizedBox(
                  width: 250,
                  height: 300,
                  child: FrameAnimation(),
                ),
              ],
            ),
          ),
          // actions: [
          //   gameButton(() {
          //     resetGame();
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => StartScreen(),
          //         ));
          //   }, "Home", Colors.grey),
          //   gameButton(() {
          //     adManager.showRewardedInterstitialAd();
          //
          //     resetGame();
          //   }, "Try again", Colors.green),
          // ],
        );
      },
    );
  }
}

class FrameAnimation extends StatefulWidget {
  @override
  _FrameAnimationState createState() => _FrameAnimationState();
}

class _FrameAnimationState extends State<FrameAnimation> {
  List<String> frames = [];
  int _currentFrame = 0;
  Timer? _timer;
  bool _isPrecached = false;

  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //
  //   if (!_isPrecached) {
  //     frames = List.generate(
  //       16,
  //           (index) => 'assets/frame/frame_${101 + index}.png',
  //     );
  //
  //     // Precache images here — safe place to access inherited widgets like MediaQuery
  //     Future.wait(frames.map(
  //           (frame) => precacheImage(AssetImage(frame), context),
  //     )).then((_) {
  //       _isPrecached = true;
  //
  //       _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
  //         if (mounted) {
  //           setState(() {
  //             _currentFrame = (_currentFrame + 1) % frames.length;
  //           });
  //         }
  //       });
  //     });
  //   }
  // }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: _isPrecached
          ? Image.asset(
        frames[_currentFrame],
        fit: BoxFit.contain,
      )
          : Center(child: CircularProgressIndicator()), // Optional loading UI
    );
  }
}
