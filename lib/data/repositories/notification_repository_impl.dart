import 'dart:developer';

import 'package:ecommerce_cloth/data/data_sources/remote/notification_data.dart';
import 'package:ecommerce_cloth/domain/repositories/notifacation_repository.dart';
import 'package:firebase_messaging_platform_interface/src/remote_message.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  @override
  Future<String?> getFcmToken() async {
    try {
      final String fcmToken = await NotificationData.getFcmToken();
      return fcmToken;
    } catch (error) {
      log(error.toString());
      return null;
    }
  }

  @override
  Future<Stream<RemoteMessage>?> listenFcmMessage() async {
    try {
      final Stream<RemoteMessage> remoteMessage =  NotificationData.listenFcmMessage();
      return remoteMessage;
    } catch (error) {
      log(error.toString());
      return null;

    }
  }
}
