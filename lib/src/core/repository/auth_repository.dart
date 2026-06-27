abstract class AuthRepository {
  Future<String?> getToken();

  Future<bool> isOnboardingCompleted();

  Future<void> saveToken(String token);

  Future<void> markOnboardingCompleted();

  Future<void> logout();
}
