import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';

import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/facebook_user_adapter.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/google_user_adapter.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_from_social.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_adapter.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticateData {
  AuthenticateData._();

  static final Dio _dio = Dio();
  static const String _endpoint = StrapiInitialize.apiEndpoint;
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
    final account = await _googleSignIn.signIn();
    return googleAdapter.adaptData(account);
  }

  static Future<int?> postUserRegistration({
    required String email,
    required String username,
    required String password,
  }) async {
    final Response response = await _dio.post(
      '$_endpoint/auth/local/register',
      data: {
        'username': username,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 400) {
      log(response.statusCode.toString());
      return response.statusCode;
    } else {
      return response.data;
    }
  }

  static Future<int?> postUserLogin({
    required String email,
    required String password,
  }) async {
    final Response response = await _dio.post(
      '$_endpoint/auth/local',
      data: {
        'identifier': email,
        'password': password,
      },
    );
    if (response.statusCode == 400) {
      log(response.statusCode.toString());
      return response.statusCode;
    } else {
      return response.data;
    }
  }
}
