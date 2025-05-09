import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes/constant/str.dart';
import 'package:shoes/page/flappy_splash_screen.dart';
import 'package:shoes/page/flappy_start_screen.dart' show FlappyStartScreen;

import '../page/flappy_play_screen.dart';
import '../page/flappy_setting_screen.dart';
class AppGenerateRoute {
  static Route<dynamic> generateRouteApp(RouteSettings settings) {
    switch (settings.name) {
      case str.flappyStartScreen:
        return MaterialPageRoute(builder: (_)=> const FlappyStartScreen());
      case str.flappySplashScreen:
        return MaterialPageRoute(builder: (_)=> const FlappySplashScreen());
      case str.games:
        return MaterialPageRoute(builder: (_)=> const FlappyPlayScreen());
      case str.setting:
        return MaterialPageRoute(builder: (_)=> const FlappySettingScreen());

      default:
        return CupertinoPageRoute(builder: (_) => UndefinedRouteScreen(routeName: settings.name!));
    }
  }

}
class UndefinedRouteScreen extends StatelessWidget {
  final String routeName;
  const UndefinedRouteScreen({Key? key, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("404 - Not Found")),
      body: Center(
        child: Text('Route "$routeName" not defined!'),
      ),
    );
  }
}
