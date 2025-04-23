
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // void initializedNotification(BuildContext context,
  //     RemoteMessage message) async {
  //   // var androidInitializedonSetting = const AndroidInitializationSettings(
  //   //     '@mipmap/ic_launcher');
  //   var androidInitializedonSetting = const AndroidInitializationSettings('ic_notification');
  //
  //   var iosInitializedonSetting = const DarwinInitializationSettings();
  //   var initializedonSetting = InitializationSettings(
  //     android: androidInitializedonSetting,
  //     iOS: iosInitializedonSetting,
  //   );
  //   await _flutterLocalNotificationsPlugin.initialize(
  //       initializedonSetting,
  //       onDidReceiveNotificationResponse: (payload) {}
  //   );
  // }
  // Future<void> showNotification(RemoteMessage messages) async {
  //   AndroidNotificationChannel channel = AndroidNotificationChannel(
  //     Random.secure().nextInt(100000).toString(),
  //     "high performance name",
  //     importance: Importance.high,
  //
  //   );
  //   AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
  //     channel.id.toString(),
  //     channel.name.toString(),
  //     channelDescription: "your channel description",
  //     importance: Importance.high,
  //     playSound: true,
  //     priority: Priority.high,
  //     ticker: "ticker",
  //   );
  //
  //   DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
  //     presentAlert: true,
  //     presentBadge: true,
  //     presentSound: true,
  //   );
  //
  //   NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidNotificationDetails,
  //     iOS: darwinNotificationDetails,
  //
  //   );
  //
  //   Future.delayed(Duration.zero, () {
  //     _flutterLocalNotificationsPlugin.show(0,
  //         messages.notification!.title.toString(),
  //         messages.notification!.body.toString(),
  //         notificationDetails
  //     );
  //   });
  // }
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  Future<void> showLocalNotification(RemoteMessage message) async {
    const AndroidInitializationSettings androidInit = AndroidInitializationSettings('@mipmap/ic_launcher'); // Make sure this icon exists

    const InitializationSettings initSettings = InitializationSettings(android: androidInit);

    await flutterLocalNotificationsPlugin.initialize(initSettings);

    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );
     DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
       presentSound: true,
       presentBadge: true,
       presentAlert: true,
     );
     NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: darwinNotificationDetails,

    );
    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
      platformDetails,
    );
  }
  void firebaseBacgroundMesages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.notification!.title.toString());
      showLocalNotification(message);
    });
  }
  void firebaseBackgroundMessages(Function (RemoteMessage) onMessageReceived) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground message received: ${message.notification?.title}");
      onMessageReceived(message); // Call the function to update count
    });
  }

  void requestServices() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user notification permission");
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user  provisions permission");
    }
    else {
      print("user permission failed");
    }
  }
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    print("device token in Flutter*****: ${token}");
    return token!;
  }
  Future<void> RedirectNotification() async{
  }

}