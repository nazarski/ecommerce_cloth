import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/local/authenticate_local_data.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/authenticate_remote_data.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_info_model.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_from_social.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserInfoEntity> requestUserRegistration({
    required String email,
    required String username,
    required String password,
    required String avatarUrl,
  }) async {
    try {
      final UserInfoModel? postRequestRegistrationUser =
          await AuthenticateRemoteData.postUserRegistration(
        email: email,
        username: username,
        password: password,
        avatarUrl: avatarUrl,
      );
      return postRequestRegistrationUser!.toEntity();
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<UserInfoEntity> requestUserLogin({
    required String email,
    required String password,
  }) async {
    try {
      final UserInfoModel? postRequestLoginUser =
          await AuthenticateRemoteData.postUserLogin(
        email: email,
        password: password,
      );
      return postRequestLoginUser!.toEntity();
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<UserModelFromSocial> requestUserFromGoogle() async {
    try {
      final UserModelFromSocial userModelFromGoogle =
          await AuthenticateRemoteData.fetchUserModelFromGoogle();
      return userModelFromGoogle;
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<UserModelFromSocial> requestUserFromFacebook() async {
    try {
      final UserModelFromSocial userModelFromFacebook =
          await AuthenticateRemoteData.fetchUserModelFromFacebook();
      return userModelFromFacebook;
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<bool> isUserExists({required String email}) async {
    try {
      final bool userExists = await AuthenticateRemoteData.isUserExists(
        email: email,
      );
      return userExists;
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<String> uploadPhoto({
    required String photoUrl,
    required String jwt,
    required int id,
    required File tempFile,
  }) async {
    try {
      final String urlPhoto = await AuthenticateRemoteData.uploadAvatar(
        tempFile: tempFile,
        photoUrl: photoUrl,
        jwt: jwt,
        id: id,
      );
      return urlPhoto;
    } catch (error) {
      if (error is DioError) {
        return error.response?.data.toString() ?? error.message.toString();
      } else {
        return error.toString();
      }
    }
  }

  @override
  Future<File> createTempFile() async {
    try {
      final File tempFile = await AuthenticateLocalData.createTempFile();
      return tempFile;
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  String deleteTempFile({required File tempFile}) {
    final String deleteCacheFile = AuthenticateLocalData.deleteTempFile(
      tempFile: tempFile,
    );
    return deleteCacheFile;
  }

  @override
  Future<Response> updateUserAvatar(
      {required String jwt,
      required String photoUrl,
      required int userId}) async {
    try {
      final Response response = await AuthenticateRemoteData.updateUserAvatar(
          userId: userId, photoUrl: photoUrl, jwt: jwt);
      return response;
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  UserInfoEntity? updateUserModel({
    required Response response,
    required String jwt,
  }) {
    try {
      final updatedUserModel = AuthenticateLocalData.updateUserModel(
        response: response,
        jwt: jwt,
      );
      return updatedUserModel.toEntity();
    } on Exception catch (error) {
      log(error.toString());
      return null;
    }
  }

  @override
  Future<void> saveUserToSecureStorage(
      {required UserInfoEntity? userModel}) async {
    try {
      await AuthenticateLocalData.saveUserToSecureStorage(
        userModel: userModel!,
      );
    } on Exception catch (error) {
      log(error.toString());
    }
  }

  @override
  Future<UserInfoEntity> getUserFromSecureStorage() async {
    try {
      final UserInfoModel userInfoModel =
          await AuthenticateLocalData.getUserFromSecureStorage();
      final UserInfoEntity userInfoEntity = userInfoModel.toEntity();
      return userInfoEntity;
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<bool> isUserLoggedIn() async {
    try {
      final bool = await AuthenticateLocalData.isUserLoggedIn();
      return bool;
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  bool? isExpired({required String jwt}) {
    try {
      final isExpire = AuthenticateLocalData.isExpired(jwt: jwt);
      return isExpire;
    } on Exception catch (error) {
      log(error.toString());
      return null;
    }
  }

  @override
  Future<void> clearSecureStorage() async {
    try {
      AuthenticateLocalData.clearSecureStorage();
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  Future<UserInfoEntity> getUserFromStrapi(
      {required String jwt, required int userId}) async {
    try {
      final currentUser = await AuthenticateRemoteData.getUserFromStrapi(
          jwt: jwt, userId: userId);
      return currentUser.toEntity();
    } catch (error) {
      return Future.error(error);
    }
  }
}
