import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoes/page/flappy_splash_screen.dart';
import 'package:shoes/routie/my_routes.dart';
import 'package:shoes/ui/home_screen_ui.dart';
import 'package:shoes/ui/splash_screen.dart';
import 'approute/app_generate_route.dart';
import 'constant/str.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   await Hive.openBox('user');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    //  initialRoute: str.flappySplashScreen,
      onGenerateRoute: AppGenerateRoute.generateRouteApp,
      home: HomeScreenUi(),
    );
  }
}

