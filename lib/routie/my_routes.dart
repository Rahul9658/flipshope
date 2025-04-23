import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes/screen/chat_screen.dart';

import '../auth/login_screen.dart';

class appRoutes {
  static const String loginScreen = "login_screen";
  static const String homeScreen = "home_screen";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
       case homeScreen:
        // return MaterialPageRoute(builder: (_) => const ChatScreen(otherUserId: '',));

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
