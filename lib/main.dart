// import 'package:flutter/material.dart';
//
// import 'auth/mobile_screen.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Bottom Navigation Bar',
//       home: MobileScreen(),
//     ),
//   );
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   HomePageState createState() => HomePageState();
// }
//
// class HomePageState extends State<HomePage> {
//   var currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: size.width *.20,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.15),
//               blurRadius: 30,
//               offset: Offset(0, 10),
//             ),
//           ],
//           // borderRadius: BorderRadius.circular(50),
//         ),
//         child: ListView.builder(
//           itemCount: 4,
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.symmetric(horizontal: size.width * .024),
//           itemBuilder: (context, index) => InkWell(
//             onTap: () {
//               setState(
//                     () {
//                   currentIndex = index;
//                 },
//               );
//             },
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AnimatedContainer(
//                   duration: Duration(milliseconds: 1500),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   margin: EdgeInsets.only(
//                     bottom: index == currentIndex ? 0 : size.width * .029,
//                     right: size.width * .0422,
//                     left: size.width * .0422,
//                   ),
//                   width: size.width * .128,
//                   height: index == currentIndex ? size.width * .014 : 0,
//                   decoration: BoxDecoration(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.vertical(
//                       bottom: Radius.circular(10),
//                     ),
//                   ),
//                 ),
//                 Icon(
//                   listOfIcons[index],
//                   size: size.width * .076,
//                   color: index == currentIndex
//                       ? Colors.blueAccent
//                       : Colors.black38,
//                 ),
//                 SizedBox(height: size.width * .03),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<IconData> listOfIcons = [
//     Icons.home_rounded,
//     Icons.favorite_rounded,
//     Icons.settings_rounded,
//     Icons.person_rounded,
//   ];
// }



import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/routie/my_routes.dart';
import 'package:shoes/screen/cloud_store.dart';
import 'package:shoes/screen/notifi_screen.dart';
import 'package:shoes/screen/splash_screen.dart';
import 'package:shoes/view_model/auth_provider.dart';

import 'auth/login_screen.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final data = message.data; // Notification data
  await NotificationServices().showLocalNotification(message);
  print("notification data is :::$data");
  print('A notif shown when the app is closed! ${message.notification}');
  print('A bg message just showed up : ${message.messageId}');
  // NotificationServicesssssss().saveEventDataList(data);
  // Notification_Service().saveEventDataList(data);
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(Home());
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>AuthProviderdddd(),
    child:  const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: appRoutes.loginScreen,
      onGenerateRoute: appRoutes.generateRoute,
    ),

    );
  }
}
