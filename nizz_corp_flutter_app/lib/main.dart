

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:niz_corp/repositories/api_repository/api_repository.dart';
import 'package:niz_corp/repositories/firebase_repository/firebase_repository.dart';
import 'package:niz_corp/util/log_functions.dart';
import 'package:niz_corp/util/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:rxdart/rxdart.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

late final SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FCM required notification permission
  final NotificationSettings notificationSettings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    criticalAlert: true,
    provisional: true,
    announcement: true,
  );

  // If the platform is Android, it will display the permission status.
  infoLog(
      functionName: "main",
      message: notificationSettings.authorizationStatus.name);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (await Permission.notification.isDenied) {
    Permission.notification.request();
  }

  await _initializeNotification();

  prefs = await SharedPreferences.getInstance();

  final fcmToken = await FirebaseMessaging.instance.getToken();

  if (fcmToken != null) {
    await prefs.setString("fcmToken", fcmToken);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final messageController = BehaviorSubject<RemoteMessage>();
  MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      

      _showNotification(
          title: message.notification?.title ?? "No title",
          body: message.notification?.body ?? "No body");

      messageController.sink.add(message);
    });

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ApiRepository(dio: Dio()),
        ),
        RepositoryProvider(
          create: (context) => FirebaseRepository(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: routes,
        initialRoute: home_screen,
      ),
    );
  }
}

Future<void> _showNotification({
  required String title,
  required String body,
}) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id',
    'your_channel_name',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0, // notification id.
    title,
    body,
    platformChannelSpecifics,
    payload: 'Notification Payload',
  );
}

// Initialize the notification settings for Android and iOS
Future _initializeNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) async {
      // Handle notification tapped logic here
    },
  );
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
