import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_user_details_repository.dart';
import 'package:ecommerce_cloth/domain/repositories/notifacation_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_intent_plus/android_intent.dart';


class NotificationService {
  final NotificationRepository _notificationRepository;
  final ManageUserRepository _manageUserRepository;
  final AuthRepository _authRepository;

  const NotificationService(this._notificationRepository, this._manageUserRepository, this._authRepository);

  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    log('Handling a background message ${message.messageId}');
  }

  Future<bool> requestPermission() async {
    final generalRequest = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    return generalRequest.authorizationStatus == AuthorizationStatus.authorized;
  }

  Future<void> handleMessage(RemoteMessage message) async {}

  Future<void> enableNotification() async {
    if (Platform.isAndroid) {
      final bool permission = await requestPermission();
      LocalNotification.initialize();
      final fcmToken = await _notificationRepository.getFcmToken();
      final userFromSecureStorage = await _authRepository.getUserFromSecureStorage();
      await _manageUserRepository.updateFcmToken(
          userInfoEntity: userFromSecureStorage!, fcmToken: fcmToken!.toString());
      final updatedFcmToken = _manageUserRepository.updateFcmTokenForSecureStorage(
        userInfoEntity: userFromSecureStorage,
        fcmToken: fcmToken,
      );
      final updatedUserPermission = _manageUserRepository.updatePermissionForSecureStorage(
        userInfoEntity: updatedFcmToken!,
        permission: permission,
      );

      await _authRepository.saveUserToSecureStorage(userModel: updatedUserPermission);
      Stream<RemoteMessage>? messageStream = await _notificationRepository.listenFcmMessage();
      messageStream?.listen((RemoteMessage message) {
        LocalNotification.showNotification(message);
      });

      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    } else {
      log('❗️❗️❗️In the current version of the application, notifications are not available for iOS devices. If you want to test notifications, please run the application on an Android device.');
    }
  }

  Future<bool> togglePermission(bool isEnabled) async {
    final UserInfoEntity? userInfoEntity = await _authRepository.getUserFromSecureStorage();
    bool isAuthorized = false;

    if (isEnabled) {
      final generalRequest = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      isAuthorized = generalRequest.authorizationStatus == AuthorizationStatus.authorized;
      _manageUserRepository.updatePermissionForSecureStorage(userInfoEntity: userInfoEntity!, permission: isAuthorized);
    } else {
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: false,
        badge: false,
        sound: false,
      );
      openNotificationSettings();
      isAuthorized = false;
    }
    _manageUserRepository.updatePermissionForSecureStorage(userInfoEntity: userInfoEntity!, permission: isAuthorized);
    return isAuthorized;
  }
  void openNotificationSettings() {
    const String packageName = 'com.example.ecommerce_cloth';
    const AndroidIntent intent = AndroidIntent(
      action: 'android.settings.APP_NOTIFICATION_SETTINGS',
      arguments: <String, dynamic>{'app_package': packageName, 'android.provider.extra.APP_PACKAGE': packageName},
    );
    intent.launch();
    //   const AndroidIntent intent = AndroidIntent(
    //     action: 'android.settings.NOTIFICATION_POLICY_ACCESS_SETTINGS',
    //   );
    //   intent.launch();
    // }
  }
}

class LocalNotification {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() {
    const InitializationSettings initializationSettings =
        InitializationSettings(android: AndroidInitializationSettings('launcher_notification'));
    _notificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static Future<void> showNotification(RemoteMessage message) async {
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'com.example.ecommerce_cloth',
        'ecommerce_cloth',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('sound'),
      ),
    );
    _notificationsPlugin.show(
      DateTime.now().microsecond,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
      payload: message.data.toString(),
    );
  }
  static Future<void> dismissPermission() async {
    await _notificationsPlugin.cancelAll();
  }
}
