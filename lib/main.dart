import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shoes/ui/home_screen_ui.dart';
import 'package:shoes/view_model/group_provider.dart';
import 'package:shoes/view_model/shared_pref_screen.dart';
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return  ChangeNotifierProvider(
        create: (_) => GroupProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       initialRoute: str.flappySplashScreen,
        onGenerateRoute: AppGenerateRoute.generateRouteApp,
      //  home: HomeScreenUi(),
      ),

    );
  }
}

