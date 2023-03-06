abstract class AuthRepository {
  Future<int?> requestUserRegistration({
    required String email,
    required String username,
    required String password,
  });
}
