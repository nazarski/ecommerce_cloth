import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_info_model.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

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
  var response = await Dio().get("http://localhost:1337/api/connect/google/callback",
    data: "code=$serverAuthCode",
  );
  print(response.data);
  // final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  // return googleUser!.serverAuthCode;
}
