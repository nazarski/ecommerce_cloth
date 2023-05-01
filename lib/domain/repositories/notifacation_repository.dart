import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationRepository {
  Future<String?> getFcmToken();

  Future<Stream<RemoteMessage>?> listenFcmMessage();
}
