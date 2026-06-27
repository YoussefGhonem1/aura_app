import 'package:aura_app/src/core/network/api_client.dart';
import 'package:aura_app/src/features/login/models/auth_session_model.dart';

import '../models/oauth_request_model.dart';
import '../models/register_request_model.dart';
import 'create_account_repository.dart';

class CreateAccountRepositoryImpl implements CreateAccountRepository {
  CreateAccountRepositoryImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<AuthSessionModel> register(RegisterRequestModel request) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      ApiEndpoints.registerUser,
      data: request.toJson(),
    );

    return _parseSession(response.data);
  }

  @override
  Future<AuthSessionModel> loginWithProvider(OAuthRequestModel request) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      ApiEndpoints.oauthLogin,
      data: request.toJson(),
    );

    return _parseSession(response.data);
  }

  Future<AuthSessionModel> _parseSession(dynamic data) async {
    if (data is Map<String, dynamic>) {
      final session = AuthSessionModel.fromJson(data);
      if (session.token.isNotEmpty) {
        await _apiClient.setAccessToken(session.token);
      }
      return session;
    }

    throw ApiException('Invalid authentication response.');
  }
}
