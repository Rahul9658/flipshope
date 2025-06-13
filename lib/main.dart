import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoes/firebase/firebase_notificaion_screen.dart';
import 'package:shoes/provider/message_provider.dart';
import 'package:shoes/provider/shared_pref_screen.dart';
import 'package:shoes/ui/chat_login_screeen.dart';
import 'package:shoes/ui/dash_chat.dart';
import 'package:shoes/ui/login_flow_screen.dart';
import 'package:shoes/ui/messages_screen.dart';
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
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => GroupProvider()),
          ChangeNotifierProvider(create: (_) =>SharedProvider()),
          ChangeNotifierProvider(create: (_)=> MessageProvider()),

      ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
       // initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: AppRoutes.generateRoute,
          home: LoginFlowScreen(),

    ),

    );
  }
}



//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'dash_chat.dart'; // Import your DashChat widget
//
// // These global variables are provided by the Canvas environment.
// // DO NOT modify these variable declarations.
// // Ensure they are correctly handled, especially for Firebase initialization.
// const String __app_id = ''; // Placeholder for app ID if not defined by environment
// const String __firebase_config = ''; // Placeholder for Firebase config if not defined by environment
// const String __initial_auth_token = ''; // Placeholder for auth token if not defined by environment
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Parse firebase config from global variable
//   final firebaseConfigMap = __firebase_config.isNotEmpty
//       ? Map<String, String>.from(
//       (const JsonDecoder().decode(__firebase_config) as Map).cast<String, String>())
//       : {};
//
//   // Initialize Firebase using the parsed config.
//   // Replace 'YOUR_DATABASE_URL' with your actual Realtime Database URL
//   // if it's not present in the firebaseConfigMap.
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: firebaseConfigMap['apiKey'] ?? '',
//       appId: firebaseConfigMap['appId'] ?? '',
//       messagingSenderId: firebaseConfigMap['messagingSenderId'] ?? '',
//       projectId: firebaseConfigMap['projectId'] ?? '',
//       databaseURL: firebaseConfigMap['databaseURL'] ?? 'YOUR_DATABASE_URL', // Ensure databaseURL is present
//     ),
//   );
//
//   // Get Firebase Auth instance
//   final auth = FirebaseAuth.instance;
//
//   // Sign in the user.
//   // If __initial_auth_token is provided, use it for custom token sign-in.
//   // Otherwise, sign in anonymously.
//   try {
//     if (__initial_auth_token.isNotEmpty) {
//       await auth.signInWithCustomToken(__initial_auth_token);
//       print("Signed in with custom token.");
//     } else {
//       await auth.signInAnonymously();
//       print("Signed in anonymously.");
//     }
//   } catch (e) {
//     print("Firebase Auth error: $e");
//   }
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Chat',
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const DashChat(),
//     );
//   }
// }
