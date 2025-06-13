import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes/bottomBar/bottom_navagation_bar.dart';
import 'package:shoes/ui/fetch_data.dart';
import 'package:shoes/ui/login_flow_screen.dart' show LoginFlowScreen;
import 'package:shoes/ui/splash_screen.dart';
import 'package:shoes/ui/update_profile_screen.dart' show UpdateProfileScreen;
class AppRoutes{
   static const String splashScreen = 'splashScreen';
   static const String loginScreen = 'loginScreen';
   static const String fetchData =  'fetchDataScreen';
   static const String bottomAppBar = 'bottomAppBar';
   static const String updateProfileScreen = '';

      static Route<dynamic> generateRoute(RouteSettings settings){
         final argument = settings.arguments;
        switch(settings.name){
         case splashScreen :
           return MaterialPageRoute(builder: (_) => const SplashScreen());
         case loginScreen :
           return MaterialPageRoute(builder: (_) => const LoginFlowScreen());
          case fetchData:
           return MaterialPageRoute(builder: (_) => FetchData(email: argument,));
          case updateProfileScreen :
            return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
          case bottomAppBar:
            return MaterialPageRoute(builder: (_) => const BottomNavagationBar());





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