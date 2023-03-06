import 'package:ecommerce_cloth/data/data_sources/remote/authenticate_data.dart';
import 'package:ecommerce_cloth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<int?> requestUserRegistration(
      {required String email, required String username, required String password}) async {
    final int? postRequestRegistrationUser = await AuthenticateData.postUserRegistration(
      email: email,
      username: username,
      password: password,
    );
    return postRequestRegistrationUser;
  }
}
