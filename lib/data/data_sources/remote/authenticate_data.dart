import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticateData {
  AuthenticateData._();

  static final Dio _dio = Dio();
  static const String _endpoint = StrapiInitialize.apiEndpoint;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FacebookAuth _facebookAuth = FacebookAuth.instance;


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

    if(response.statusCode == 400) {
      log(response.statusCode.toString());
      return response.statusCode;
    } else {
      return response.data;
    }
  }
}

Future getServerAuthCode() async {
  // final result = await FlutterWebAuth2.authenticate(
  //     url: "http://bugsmakersteam.pp.ua:1337/api/connect/google",
  //     callbackUrlScheme: "ecommercecloth");
  // print(result);
  // final GoogleSignIn googleSignIn = GoogleSignIn(
  //   clientId:
  //       '460886256000-ct04n051ja2rl1puvllsrc13q1hkvbl7.apps.googleusercontent.com',
  //   serverClientId:
  //       '460886256000-84hkecdk63fdbsik361ljfl6dlnl4vmf.apps.googleusercontent.com',
  // );
  // final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  // print(googleUser!.serverAuthCode);
  //
  // return googleUser.serverAuthCode;
}

Future getUser(String serverAuthCode) async {
  var response = await Dio().get(
    "http://localhost:1337/api/connect/google/callback",
    data: "code=$serverAuthCode",
  );
  print(response.data);
  // final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  // return googleUser!.serverAuthCode;
}
