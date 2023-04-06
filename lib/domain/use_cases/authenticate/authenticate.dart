import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/core/enums/authenticate_type.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_from_social.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_credential_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/auth_repository.dart';

class Authenticate {
  final AuthRepository _authRepository;

  const Authenticate(this._authRepository);

  static const String endpoint = StrapiInitialize.endpoint;

  Future<UserModelFromSocial> _getUserFromGoogle() async {
    final userFromGoogle = _authRepository.requestUserFromGoogle();
    return userFromGoogle;
  }

  Future<UserModelFromSocial> _getUserFromFacebook() async {
    final userFromFacebook = _authRepository.requestUserFromFacebook();
    return userFromFacebook;
  }

  Future<void> _saveUserToSecureStorage({required UserInfoEntity? userData}) async {
    await _authRepository.saveUserToSecureStorage(
      userModel: userData,
    );
  }

  Future<UserInfoEntity?> _uploadAvatarProcess({required UserInfoEntity? userData}) async {
    final File tempFile = await _authRepository.createTempFile();
    final pathToAvatar = await _uploadAvatar(
      tempFile: tempFile,
      photoUrl: userData!.photoUrl,
      jwt: userData.jwt,
      id: userData.id,
    );
    _authRepository.deleteTempFile(tempFile: tempFile);
    final Response responseAvatar = await _authRepository.updateUserAvatar(
      jwt: userData.jwt,
      photoUrl: pathToAvatar,
      userId: userData.id,
    );
    final UserInfoEntity? updatedUser = _authRepository.updateUserModel(
      response: responseAvatar,
      jwt: userData.jwt,
    );
    return updatedUser;
  }

  Future<String> _uploadAvatar({
    required String? photoUrl,
    required String jwt,
    required int id,
    required File tempFile,
  }) async {
    final String urlAvatar = await _authRepository.uploadPhoto(
      tempFile: tempFile,
      photoUrl: photoUrl!,
      jwt: jwt,
      id: id,
    );
    return urlAvatar;
  }

  Future<UserInfoEntity?> _loginUser({
    required String email,
    required String password,
  }) async {
    final userData = _authRepository.requestUserLogin(
      email: email,
      password: password,
    );
    return userData;
  }

  Future<bool> _isUserExist({required String email}) {
    final userExist = _authRepository.isUserExists(email: email);
    return userExist;
  }

  Future<UserInfoEntity?> _registerUser({
    required String email,
    required String username,
    required String password,
    required String avatarUrl,
  }) async {
    final userData = _authRepository.requestUserRegistration(
      email: email,
      username: username,
      password: password,
      avatarUrl: avatarUrl,
    );
    return userData;
  }

  Future<void> _authenticateUserFromGoogle() async {
    final UserModelFromSocial getUserFromGoogle = await _getUserFromGoogle();
    final bool userExist = await _isUserExist(email: getUserFromGoogle.email);
    if (userExist) {
      final UserInfoEntity? updatedLoginUser = await _loginUser(
        email: getUserFromGoogle.email,
        password: getUserFromGoogle.email,
      );
      await _saveUserToSecureStorage(userData: updatedLoginUser);
    } else {
      final UserInfoEntity? userdata = await _registerUser(
        avatarUrl:getUserFromGoogle.photoUrl,
        email: getUserFromGoogle.email,
        username: getUserFromGoogle.userName,
        password: getUserFromGoogle.email,
      );
      final UserInfoEntity? updatedUser = await _uploadAvatarProcess(userData: userdata);

      await _saveUserToSecureStorage(userData: updatedUser);
    }
  }

  Future<void> _authenticateUserFromFacebook() async {
    final UserModelFromSocial getUserFromFacebook = await _getUserFromFacebook();
    final bool userExist = await _isUserExist(email: getUserFromFacebook.email);
    if (userExist) {
      final UserInfoEntity? updatedLoginUser = await _loginUser(
        email: getUserFromFacebook.email,
        password: getUserFromFacebook.email,
      );
      await _saveUserToSecureStorage(userData: updatedLoginUser);
    } else {
      final UserInfoEntity? userdata = await _registerUser(
        avatarUrl: getUserFromFacebook.photoUrl,
        email: getUserFromFacebook.email,
        username: getUserFromFacebook.userName,
        password: getUserFromFacebook.email,
      );
      final UserInfoEntity? updatedUser = await _uploadAvatarProcess(userData: userdata);

      await _saveUserToSecureStorage(userData: updatedUser);
    }
  }

  Future<void> _authorizationUserFromApp({
    required String email,
    required String password,
  }) async {
    print('aaaaa');
    final UserInfoEntity? userdata = await _loginUser(
      email: email,
      password: password,
    );
    await _saveUserToSecureStorage(userData: userdata);
  }

  Future<void> _registerUserFromApp({
    required String avatarUrl,
    required String email,
    required String username,
    required String password,
  }) async {
    final UserInfoEntity? userdata = await _registerUser(
      email: email,
      username: username,
      password: password,
      avatarUrl: avatarUrl,
    );
    await _saveUserToSecureStorage(userData: userdata);
  }

  Future authenticateByType({
    required UserCredentialEntity userCredential,
  }) async {
    final credential = userCredential;
    switch (credential.type) {
      case AuthenticateType.google:
        return await _authenticateUserFromGoogle();
      case AuthenticateType.facebook:
        return await _authenticateUserFromFacebook();
      case AuthenticateType.registration:
        return await _registerUserFromApp(
          avatarUrl: '',
          email: credential.email!,
          username: credential.username!,
          password: credential.password!,
        );
      case AuthenticateType.authorization:
        return await _authorizationUserFromApp(
          email: credential.email!,
          password: credential.password!,
        );
      default:
        log('Error by type');
    }
  }

  Future<bool> isUserExist() async {
    return await _authRepository.isUserLoggedIn();
  }

  Future<bool?> isExpired() async {
    final loggedIn = await _authRepository.isUserLoggedIn();
    if (loggedIn) {
      final getUser = await _authRepository.getUserFromSecureStorage();
      return _authRepository.isExpired(jwt: getUser!.jwt);
    } else {
      return false;
    }
  }

  Future<UserInfoEntity?> getUserInfoFromSecureStorage() async {
    final getUser = await _authRepository.getUserFromSecureStorage();
    return getUser;
  }

  Future<void> logOut() async {
    await _authRepository.clearSecureStorage();
  }
}
