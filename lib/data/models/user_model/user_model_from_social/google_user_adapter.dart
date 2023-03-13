import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_from_social.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_adapter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleUserAdapter implements UserDataAdapterFromSocial {
  @override
  UserModelFromSocial adaptData(dynamic data) {
    final GoogleSignInAccount? googleAccount = data;
    if (googleAccount != null) {
      return UserModelFromSocial(
        userName: googleAccount.displayName.toString(),
        email: googleAccount.email,
        photoUrl: googleAccount.photoUrl ?? '',
      );
    }
    throw Exception('Failed to save data to model from Google');
  }
}