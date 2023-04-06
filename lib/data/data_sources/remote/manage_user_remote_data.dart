import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_info_model.dart';

class ManageUserRemoteData {
  ManageUserRemoteData._();

  static final Dio _dio = Dio();

  static const String _apiEndpoint = StrapiInitialize.apiEndpoint;

  static Future<void> updateFullNameAndDateOfBirth({
    required UserInfoModel userInfoModel,
  }) async {
    final data = {
      'fullName': userInfoModel.fullName,
      'dateOfBirth': userInfoModel.dateOfBirth,
    };
    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer ${userInfoModel.jwt}',
    };
    final response = await _dio.put('$_apiEndpoint/users/${userInfoModel.id}',
        data: data,
        options: Options(
          headers: headers,
        ));
    log('✅ Successful: The fields are updated on server');
  }

  static Future<void> updateFcmToken({
    required UserInfoModel userInfoModel,
    required String fcmToken,
  }) async {
    final data = {
      'fcm': fcmToken,
    };
    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer ${userInfoModel.jwt}',
    };
    final response = await _dio.put('$_apiEndpoint/users/${userInfoModel.id}',
        data: data,
        options: Options(
          headers: headers,
        ));
    log('✅ Successful: The fields are updated on server');
  }

  static Future<void> resetPassword({
    required String jwt,
    required String currentPassword,
    required String newPassword,
  }) async {
    final data = {
      'currentPassword': currentPassword,
      'password': newPassword,
      'passwordConfirmation': newPassword,
    };
    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
    };
    await _dio.post('$_apiEndpoint/auth/change-password',
        data: data,
        options: Options(
          headers: headers,
        ));
  }
}
