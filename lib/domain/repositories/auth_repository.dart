import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_from_social.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';

abstract class AuthRepository {
  Future<UserInfoEntity?> requestUserRegistration({
    required String email,
    required String username,
    required String password,
    required String avatarUrl,
  });

  Future<UserInfoEntity?> requestUserLogin({
    required String email,
    required String password,
  });

  Future<UserModelFromSocial> requestUserFromGoogle();

  Future<UserModelFromSocial> requestUserFromFacebook();

  Future<bool> isUserExists({required String email});

  Future<String> uploadPhoto({
    required String photoUrl,
    required String jwt,
    required int id,
    required File tempFile,
  });

  Future<File> createTempFile();

  String deleteTempFile({required File tempFile});

  Future<Response> updateUserAvatar({
    required String jwt,
    required String photoUrl,
    required int userId,
  });

  UserInfoEntity? updateUserModel({
    required Response response,
    required String jwt,
  });

  Future<void> saveUserToSecureStorage({
    required UserInfoEntity? userModel,
  });

  Future<UserInfoEntity?> getUserFromSecureStorage();

  Future<bool> isUserLoggedIn();

  bool? isExpired({required String jwt});

  Future<void> clearSecureStorage();
}
