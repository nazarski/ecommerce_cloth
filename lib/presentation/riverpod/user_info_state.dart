import 'package:ecommerce_cloth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/authenticate/authenticate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _authenticate = Authenticate(AuthRepositoryImpl());

final getUserInfo = FutureProvider<UserInfoEntity>((ref) async {
  final UserInfoEntity userInfo = await _authenticate.getUserInfoFromSecureStorage();
  return userInfo;

});


