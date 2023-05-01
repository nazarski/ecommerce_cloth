import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';

abstract class ManageUserRepository {
  Future<void> updateFullNameAndDateOfBirth({
    required UserInfoEntity userInfoEntity,
  });

  Future<void> resetPassword({
    required String jwt,
    required String currentPassword,
    required String newPassword,
  });

  Future<void> updateFcmToken(
      {required UserInfoEntity userInfoEntity, required String fcmToken});

  // Future<UserInfoEntity?> universalUpdateUserModelFromSecureStorage({
  //   required UserInfoEntity userInfoEntity,
  //   String? fcmToken,
  //   String? fullName,
  //   String? dateOfBirth,
  //   bool? notification,
  // });

  UserInfoEntity? updateFcmTokenForSecureStorage({
    required UserInfoEntity userInfoEntity,
    required String fcmToken,
  });

  UserInfoEntity? updatePermissionForSecureStorage({
    required UserInfoEntity userInfoEntity,
    required bool permission,
  });
}
