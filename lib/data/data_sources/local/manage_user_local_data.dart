import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';

class ManageUserLocalData {
  ManageUserLocalData._();

  // static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static UserInfoEntity updateFcmToken(
      {required UserInfoEntity userInfoEntity, required String fcmToken}) {
    final userModel = userInfoEntity;
    userModel.copyWith(fcmToken: fcmToken);
    return userModel;
  }

  static UserInfoEntity updateNotification(
      {required UserInfoEntity userInfoEntity, required bool notification}) {
    final userModel = userInfoEntity;
    userModel.copyWith(notification: notification);
    return userModel;
  }
}
