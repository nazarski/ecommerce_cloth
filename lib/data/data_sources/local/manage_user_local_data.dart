import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ManageUserLocalData {
  ManageUserLocalData._();

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  // static Future<UserInfoEntity> universalUpdateUserModel({
  //   required UserInfoEntity userInfoEntity,
  //   String? fullMame,
  //   String? dateOfBirth,
  //   bool? notification,
  //   String? fcmToken,
  // }) async {
  //   final UserInfoEntity user = userInfoEntity;
  //   if(fullMame != null) user.copyWith(fullName: fullMame);
  //   if(dateOfBirth != null) user.copyWith(dateOfBirth: dateOfBirth);
  //   if(notification != null) user.copyWith(notification: notification);
  //   if(fcmToken != null) user.copyWith(fcmToken: fcmToken);
  //   print(user);
  //   return user;
  // }

  static UserInfoEntity updateFcmToken({ required UserInfoEntity userInfoEntity, required String fcmToken}) {
    final userModel = userInfoEntity;
    userModel.copyWith(fcmToken: fcmToken);
    return userModel;
  }
  static UserInfoEntity updateNotification({ required UserInfoEntity userInfoEntity, required bool notification}) {
    final userModel = userInfoEntity;
    userModel.copyWith(notification: notification);
    return userModel;
  }
}
