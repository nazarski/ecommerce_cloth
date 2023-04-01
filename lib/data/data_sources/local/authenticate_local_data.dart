import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_info_model.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:path_provider/path_provider.dart';

class AuthenticateLocalData {
  AuthenticateLocalData._();

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const String endpoint = StrapiInitialize.endpoint;
  static Future<File> createTempFile() async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/temp.jpeg');
    log('✅ Successful: created local temp directory');
    return tempFile.create(recursive: true);
  }

  static String deleteTempFile({required File tempFile}) {
    tempFile.deleteSync();
    return '✅ Successful: Delete temp file';
  }

  static UserInfoModel updateUserModel({
    required Response response,
    required String jwt,
  }) {
    final userData = response.data;
    final updateUser = UserInfoModel(
      id: userData['id'],
      jwt: jwt,
      createdAt: DateTime.parse(userData['createdAt']),
      displayName: userData['username'],
      email: userData['email'],
      favorites: [],
      photoUrl: userData['avatarUrl'], fullName: '', dateOfBirth: '',
    );
    log('✅ Successful: Update user');
    return updateUser;
  }

  static Future<void> saveUserToSecureStorage({
    required UserInfoEntity userModel,
  }) async {
    final userModelFromEntity = UserInfoModel.fromEntity(entity: userModel);
    final modelFromMap = userModelFromEntity.toMap();
    final jsonUserModel = jsonEncode(modelFromMap);
    await _secureStorage.write(key: 'user', value: jsonUserModel);
    log('✅ Successful: User saved successfully');
  }

  static Future<UserInfoModel> getUserFromSecureStorage() async {
    final userModelFromStorage = await _secureStorage.read(key: 'user');
    final UserInfoModel userInfoModel = UserInfoModel.fromMap(
      jsonDecode(userModelFromStorage!),
    );
    log('✅ Successful: Received all secure data');
    return userInfoModel;
  }

  static Future<void> clearSecureStorage() async {
    await _secureStorage.deleteAll();
    log('✅ Successful: Secure storage has been cleared');
  }

  static Future<bool> isUserLoggedIn() async {
    final user = await _secureStorage.read(key: 'user');
    return user != null;
  }

  static bool isExpired({required String jwt}) {
    final jwtDecode = JwtDecoder.decode(jwt);
    final getExpire = jwtDecode['exp'];
    final dateTimeOneDayBefore = DateTime.fromMillisecondsSinceEpoch(getExpire * 1000).subtract(
      const Duration(days: 1),
    );
    final bool actualExpire = !DateTime.now().isAfter(dateTimeOneDayBefore);
    final formatter = DateFormat('dd.MM.yyyy');
    final formattedDate = formatter.format(dateTimeOneDayBefore);
    log('⚠️ The expiration date of the token is equal to $formattedDate');
    return actualExpire;
  }
}

// String test () {
//   final String jwt = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTc0LCJpYXQiOjE2Nzg4MDE4NzMsImV4cCI6MTY4MTM5Mzg3M30.OQUtpIMHlMNjfK_0XshJdgXnJ73xYtbBGzE12VhuRl8';
//   final decode = JwtDecoder.decode(jwt);
//   final expireTime = decode['exp'];
//   final dateTime = DateTime.fromMillisecondsSinceEpoch(expireTime * 1000).subtract(Duration(days: 1));
//   final formatter = DateFormat('dd.MM.yyyy');
//   final formattedDate = formatter.format(dateTime);
//   print(formattedDate);
//   final after = DateTime.now().isAfter(dateTime);
//   print(after.toString());
//   return expireTime.toString();
// }
