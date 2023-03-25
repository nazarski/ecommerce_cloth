// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class PushNotificationService {
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
//
//   Future initialise() async {
//
//     if (Platform.isIOS) {
//       // Запрашиваем разрешение на получение уведомлений для iOS
//       await _fcm.requestPermission(
//         sound: true,
//         badge: true,
//         alert: true,
//         announcement: false,
//       );
//     } else {
//       // Запрашиваем разрешение на получение уведомлений для Android
//       await _fcm.requestPermission();
//     }
//
//     // Получаем FCM-токен
//     String? token = await _fcm.getToken();
//
//     // Выводим FCM-токен в консоль
//     print('FirebaseMessaging token: $token');
//
//     // Обработка входящих сообщений
//     // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     //   print("onMessage: ${message.data}");
//     //   // Обрабатываем входящее уведомление
//     //   _handleMessage(message.data);
//     // });
//
//     // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//     //   print("onResume: ${message.data}");
//     //   // Обрабатываем уведомление, если приложение открыто в данный момент
//     //   _handleMessage(message.data);
//     // });
//
//     FirebaseMessaging.onBackgroundMessage(_handleMessage );
//   }
//
//   Future<void> _handleMessage(RemoteMessage message) async {
//     // Обрабатываем входящее уведомление
//     print('Handling a background message: $message');
//   }
// }
