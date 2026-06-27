import 'package:aura_app/src/features/login/models/auth_session_model.dart';

import '../models/oauth_request_model.dart';
import '../models/register_request_model.dart';

abstract class CreateAccountRepository {
  Future<AuthSessionModel> register(RegisterRequestModel request);

  Future<AuthSessionModel> loginWithProvider(OAuthRequestModel request);
}
