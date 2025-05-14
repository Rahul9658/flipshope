import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/constant/background_theme.dart';
import 'package:shoes/constant/const_screen.dart';
import 'package:shoes/constant/str.dart' show str;
import 'package:shoes/database/database_screen.dart' show write;
import 'package:shoes/page/flappy_start_screen.dart' show FlappyStartScreen;
import 'package:shoes/view_model/group_provider.dart' show GroupProvider;
import 'package:shoes/widget/flappy_barrier_screen.dart' show Barrier;
import 'package:shoes/widget/fly_bird_screen.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);
  @override
  State<GamePage> createState() => _GamePageState();
}
class _GamePageState extends State<GamePage> {
  List<String> frames = [];
  @override
  Widget build(BuildContext context) {
    final groupProvider = context.watch<GroupProvider>();
    return GestureDetector(
      onTap: groupProvider.gameHasStarted ? groupProvider.jump : groupProvider.startGame,
      child: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: backgroundImages(str.images),
              child: Stack(
                children: [
                  BirdsButtion( groupProvider.yAxis , groupProvider.birdHeight, groupProvider.birdWidth),
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: Text(
                      groupProvider.gameHasStarted ? '' : 'TAP TO START', style: TextStyle(fontSize: 25,color: Colors.white, ),),
                    ),
                  Barrier(groupProvider.barrierHeight[0][0], groupProvider.barrierWidth, true, groupProvider.barrierX[0]),
                  Barrier(groupProvider.barrierHeight[0][1], groupProvider.barrierWidth, false, groupProvider.barrierX[0]),
                  Barrier(groupProvider.barrierHeight[1][0], groupProvider.barrierWidth, true, groupProvider.barrierX[1]),
                  Barrier(groupProvider.barrierHeight[1][1], groupProvider.barrierWidth, false, groupProvider.barrierX[1]),
                  Positioned(
                    top: 35,
                    right: 15,
                    left: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Score : ${groupProvider.score}",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 30,
                                fontFamily: "04B_19__"),
                          ), // Best TEXT
                          // Text("Best : ${groupProvider.topScore}",
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








  // void _showDialog() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.white,
  //         shape:
  //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
  //         title: Text("..Oops", style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blue[900],fontSize: 35),),
  //         actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
  //         content: SizedBox(
  //           height: MediaQuery.of(context).size.height / 2.5,
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text("Score : $score", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.blue[900]),),
  //                   Text("Best : $topScore",  style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.blue[900]),),
  //                 ],
  //               ),
  //
  //               SizedBox(
  //                 width: 250,
  //                 height: 300,
  //                 child: FrameAnimation(),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           GestureDetector(
  //             onTap: ()
  //              {
  //            resetGame();
  //          Navigator.push(context,MaterialPageRoute(builder: (context)=>FlappyStartScreen()) );
  //
  //         },
  //
  //               child: Text("Home",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.grey,)
  //
  //               ),
  //
  //
  //             // gameButton(() {
  //             //   adManager.showRewardedInterstitialAd();
  //             //
  //             //   resetGame();
  //             // }, "Try again", Colors.green),
  //
  //           )],
  //       );
  //     },
  //   );
  // }
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
