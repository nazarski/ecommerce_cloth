import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_from_social.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_model_from_social/user_model_adapter.dart';

class FacebookUserAdapter implements UserDataAdapterFromSocial {
  @override
  UserModelFromSocial adaptData(dynamic data) {
    final Map<String, dynamic> facebookData = data;
    return UserModelFromSocial(
      userName: facebookData['name'],
      email: facebookData['email'],
      photoUrl: facebookData['picture']['data']['url'],
    );
  }
}
