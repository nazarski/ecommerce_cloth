import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationData {
  NotificationData._();

  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final StreamController<RemoteMessage> _messageController = StreamController<RemoteMessage>();

  static Future<String> getFcmToken() async {
    final token = await _messaging.getToken();
    log('FCM Token: $token');
    return token!;
  }

  static Stream<RemoteMessage> listenFcmMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      _messageController.add(message);
    });

    return _messageController.stream;
  }
}
