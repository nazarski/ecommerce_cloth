import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_info_model.dart';

import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/facebook_user_adapter.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/google_user_adapter.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_from_social.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_adapter.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticateRemoteData {
  AuthenticateRemoteData._();

  static final Dio _dio = Dio();

  static const String _apiEndpoint = StrapiInitialize.apiEndpoint;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FacebookAuth _facebookAuth = FacebookAuth.instance;

  static Future<UserModelFromSocial> fetchUserModelFromFacebook() async {
    final UserDataAdapterFromSocial facebookAdapter = FacebookUserAdapter();
    await _facebookAuth.login();
    final account = await _facebookAuth.getUserData();
    return facebookAdapter.adaptData(account);
  }

  static Future<UserModelFromSocial> fetchUserModelFromGoogle() async {
    final UserDataAdapterFromSocial googleAdapter = GoogleUserAdapter();
    final account = await _googleSignIn.signIn(
    );
    final pr = _googleSignIn.clientId;
    print(pr);
    print(account!.displayName);
    return googleAdapter.adaptData(account);
  }

  static Future<UserInfoModel?> postUserRegistration({
    required String email,
    required String username,
    required String password,
    required String avatarUrl,
  }) async {
    final Response response = await _dio.post(
      '$_apiEndpoint/auth/local/register',
      data: {
        'username': username,
        'email': email,
        'password': password,
        'avatarUrl': avatarUrl,
      },
    );

    if (response.statusCode == 200) {
      final userData = response.data;

      final user = UserInfoModel.fromResponse(userData);
      log('✅ Successful: Registration user on server');
      return user;
    } else {
      throw Exception('failed to load user $email');
    }
  }

  static Future<UserInfoModel?> postUserLogin({
    required String email,
    required String password,
  }) async {
    final Response response = await _dio.post(
      '$_apiEndpoint/auth/local',
      data: {
        'identifier': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      final userData = response.data;
      final user = UserInfoModel.fromResponse(userData);
      log('✅ Successful: Authorization');
      return user;
    } else {
      throw Exception('failed to load user $email');
    }
  }

  static Future<bool> isUserExists({
    required String email,
  }) async {
    final response = await _dio.get(
      '$_apiEndpoint/users?filters[email]=${email.toLowerCase()}',
    );

    if (response.statusCode == 200 && response.data != null) {
      final users = response.data as List;
      return users.isNotEmpty;
    } else {
      throw Exception('Failed to check user existence');
    }
  }

  static Future<String> uploadAvatar({
    required String photoUrl,
    required String jwt,
    required int id,
    required File tempFile,
  }) async {
    await _dio.download(photoUrl, tempFile.path);
    final formData = FormData.fromMap({
      'files': await MultipartFile.fromFile(tempFile.path),
      'ref': 'plugin::users-permissions.user',
      'refId': id,
      'field': 'photoUrl',
    });
    final uploadResponse = await _dio.post(
      '$_apiEndpoint/upload',
      data: formData,
      options: Options(
        headers: {
          "Authorization": "Bearer $jwt",
        },
      ),
    );
    final uploadedFileId = uploadResponse.data.first['url'];
    log('✅ Successful: Avatar is downloaded on server');
    return uploadedFileId;
  }

  static Future<Response> updateUserAvatar({
    required int userId,
    required String photoUrl,
    required String jwt,
  }) async {
    final data = {
      'avatarUrl': photoUrl,
    };
    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    final response = await _dio.put('$_apiEndpoint/users/$userId',
        data: data,
        options: Options(
          headers: headers,
        ));
    log('✅ Successful: Avatar-field is updated on server');
    return response;
  }

  static Future<UserInfoModel> getUserFromStrapi({required String jwt, required int userId}) async {
    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    final response = await _dio.get(
      '$_apiEndpoint/users/$userId',
      queryParameters: {
        'fields': 'id',
        'populate[favourites][fields]': 'id',
        'populate[favourites][populate][product][fields]': 'id',
      },
      options: Options(headers: headers),
    );
    return UserInfoModel.from(response.data);
  }


  bool isExpired(String? token) {
    if (token == null) return true;
    final jwt = JwtDecoder.decode(token);
    final expiryTime = jwt['exp'];
    if (expiryTime == null) return true;
    final expiry = DateTime.fromMillisecondsSinceEpoch(expiryTime * 1000);
    return DateTime.now().isAfter(expiry);
  }
}
