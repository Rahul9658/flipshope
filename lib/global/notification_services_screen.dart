import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationServicesClass {
   FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? fcmToken;
    int notification = 0;
   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
   Future <dynamic> showNotification(RemoteMessage message) async {
       AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
       DarwinInitializationSettings darwinInitializationSettings = const DarwinInitializationSettings();
        InitializationSettings initializationSettings = InitializationSettings(
          android: androidInitializationSettings,
          iOS: darwinInitializationSettings,
        );
        flutterLocalNotificationsPlugin.initialize(initializationSettings);
         AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
             "channel_id",
             "channel_name",
            channelDescription: "channel description",
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
         );
         DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
           presentAlert: true,
           presentBadge: true,
           presentSound: true,
           presentBanner: true,
         );
         NotificationDetails notificationDetails = NotificationDetails(
           android: androidNotificationDetails,
           iOS: darwinNotificationDetails,
         );
           await flutterLocalNotificationsPlugin.show(
               notification++,
               message.notification!.title.toString(),
               message.notification!.body.toString(),
               notificationDetails

           );
     }
    Future<void> notificationServices () async{
     NotificationSettings settings = await messaging.requestPermission(
       alert: true,
       sound: true,
       announcement: true,
       badge: true,
       provisional: true,
       carPlay: true,
       criticalAlert: false,
     );
      if(settings.authorizationStatus == AuthorizationStatus.authorized){
        debugPrint("----Allow notification permission -----");
      }
      else if(settings.authorizationStatus == AuthorizationStatus.denied){
        debugPrint("----Denied notification permission -----");
      }
      else if(settings.authorizationStatus == AuthorizationStatus.provisional){
        debugPrint("---- notification permission -----");
      }
   }

   Future<void> recivedNotificationMessages() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      debugPrint("send notification title ${message.notification!.title.toString()}");
      showNotification(message);
    });

    debugPrint("count notification****: $notification");
     }

   Future<String ?> deviceToken() async {
     try{
       fcmToken = await messaging.getToken();
       debugPrint("Device token******: $fcmToken");
       return fcmToken;
     }catch(e){
      debugPrint("failed device token $e");
     }
     return null;
   }

}