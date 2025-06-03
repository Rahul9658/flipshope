import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoes/firebase/firebase_notificaion_screen.dart';
import 'approute/app_route.dart';
import 'provider/group_provider.dart';

Future<void> firebaseOnBackgroundMessages(RemoteMessage message) async {
  try {
    NotificationServicesClass().showNotification(message);
    debugPrint("Background handle notification permission");
  } catch (e) {
    debugPrint("Exception $e");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseOnBackgroundMessages);
  // await Hive.initFlutter();
  // await Hive.openBox('user');
  runApp(const MyApp());
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
       initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: AppRoutes.generateRoute,
      //  home: HomeScreenUi(),
      //   home:SplashScreen()
      ),

    );
  }
}
