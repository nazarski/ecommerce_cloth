abstract class AuthRepository {
  Future<int?> requestUserRegistration({
    required String email,
    required String username,
    required String password,
  });

  Future<int?> requestUserLogin({
    required String email,
    required String password,
  });
}
