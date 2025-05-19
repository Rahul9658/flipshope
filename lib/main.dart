import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoes/view_model/group_provider.dart';
import 'global/global_auth_page.dart';
import 'global/notification_services_screen.dart';

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
       // initialRoute: appRoutes.splashscreen,
       //  onGenerateRoute: appRoutes.generateRoute,
      //  home: HomeScreenUi(),
        home:GlobalAuthPage()
      ),

    );
  }
}
