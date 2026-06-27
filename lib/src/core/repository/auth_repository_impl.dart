import 'package:shared_preferences/shared_preferences.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  static const String _tokenKey = 'auth_token';
  static const String _onboardingCompletedKey = 'onboarding_completed';

  Future<SharedPreferences> get _prefs async {
    return SharedPreferences.getInstance();
  }

  @override
  Future<String?> getToken() async {
    final prefs = await _prefs;
    return prefs.getString(_tokenKey);
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    final prefs = await _prefs;
    return prefs.getBool(_onboardingCompletedKey) ?? false;
  }

  @override
  Future<void> saveToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString(_tokenKey, token);
  }

  @override
  Future<void> markOnboardingCompleted() async {
    final prefs = await _prefs;
    await prefs.setBool(_onboardingCompletedKey, true);
  }

  @override
  Future<void> logout() async {
    final prefs = await _prefs;
    await prefs.remove(_tokenKey);
  }
}
