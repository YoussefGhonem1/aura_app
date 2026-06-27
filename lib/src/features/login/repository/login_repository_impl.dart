import 'package:aura_app/src/core/network/api_client.dart';

import '../models/auth_session_model.dart';
import '../models/login_request_model.dart';
import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<AuthSessionModel> login(LoginRequestModel request) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        ApiEndpoints.loginUser,
        data: request.toJson(),
      );

      final responseData = response.data;
      if (responseData is Map<String, dynamic>) {
        final session = AuthSessionModel.fromJson(responseData);
        if (session.token.isNotEmpty) {
          await _apiClient.setAccessToken(session.token);
        }
        return session;
      }

      throw ApiException('Invalid login response.');
    } on ApiException {
      rethrow;
    }
  }
}
