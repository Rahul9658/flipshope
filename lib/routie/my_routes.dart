import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes/auth/signup_screen.dart';
import 'package:shoes/screen/chat_screen.dart';
import 'package:shoes/ui/onboard_screen.dart' show OnboardScreen;
import 'package:shoes/ui/splash_screen.dart';
import 'package:shoes/ui/spoty_dashboard_screen.dart' show SpotyDashboardScreen;
import 'package:shoes/ui/spoty_login_screen.dart' show SpotyLoginScreen;

import '../auth/login_screen.dart';
import '../ui/all_auth_screen.dart';

class appRoutes {
  static const String splashscreen = "splash_screen";
  static const String onboardScreen = "onboard_Screen";
  static const String allAuthScreen = "allAuth_Screen";
  static const String spotyLoginScreen = "spotyLogin_Screen";
  static const String spotyDashboardScreen ="spotyDashboard_Screen";
  static const String signupScreen = "signup_Screen";
  static const String homeScreen = "home_screen";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen1());
        case onboardScreen:
        return MaterialPageRoute(builder: (_) => const OnboardScreen());
        case allAuthScreen:
        return MaterialPageRoute(builder: (_) => const AllAuthScreen());
        case signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
        case spotyLoginScreen:
        return MaterialPageRoute(builder: (_) => const SpotyLoginScreen() );
        case spotyDashboardScreen :
        return MaterialPageRoute(builder: (_)=> const SpotyDashboardScreen());


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
