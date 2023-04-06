import 'dart:developer';

import 'package:ecommerce_cloth/data/data_sources/local/manage_user_local_data.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/manage_user_remote_data.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_info_model.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_user_details_repository.dart';

class ManageUserRepositoryImpl extends ManageUserRepository {
  @override
  Future<void> updateFullNameAndDateOfBirth({
    required UserInfoEntity userInfoEntity,
  }) async {
    try {
      final UserInfoModel userInfoModel = UserInfoModel.fromEntity(entity: userInfoEntity);
      await ManageUserRemoteData.updateFullNameAndDateOfBirth(userInfoModel: userInfoModel);
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<void> resetPassword({
    required String jwt,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await ManageUserRemoteData.resetPassword(
        jwt: jwt,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<void> updateFcmToken({
    required UserInfoEntity userInfoEntity,
    required String fcmToken,
  }) async {
    try {
      final UserInfoModel userInfoModel = UserInfoModel.fromEntity(entity: userInfoEntity);
      await ManageUserRemoteData.updateFcmToken(
        userInfoModel: userInfoModel,
        fcmToken: fcmToken,
      );
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  UserInfoEntity? updateFcmTokenForSecureStorage({required UserInfoEntity userInfoEntity, required String fcmToken}) {
  try{
    final userModel = ManageUserLocalData.updateFcmToken(userInfoEntity: userInfoEntity, fcmToken: fcmToken);
    return userModel;
  } catch (error) {
    log(error.toString());
    return null;
  }
  }

  @override
  UserInfoEntity? updatePermissionForSecureStorage({required UserInfoEntity userInfoEntity, required bool permission}) {
    try{
      final userModel = ManageUserLocalData.updateNotification(userInfoEntity: userInfoEntity, notification: permission);
      return userModel;
    } catch (error) {
      log(error.toString());
      return null;
    }
  }

  // @override
  // Future<UserInfoEntity?> universalUpdateUserModelFromSecureStorage({
  //   required UserInfoEntity userInfoEntity,
  //   String? fcmToken,
  //   String? fullName,
  //   String? dateOfBirth,
  //   bool? notification,
  // }) async {
  //   try {
  //     final userModel = ManageUserLocalData.universalUpdateUserModel(userInfoEntity: userInfoEntity,
  //       fcmToken: fcmToken,
  //       fullMame: fullName,
  //       dateOfBirth: dateOfBirth,
  //       notification: notification,);
  //     return userModel;
  //   } catch (error) {
  //     log(error.toString());
  //     return null;
  //   }
  // }
}
