import '../models/auth_session_model.dart';
import '../models/login_request_model.dart';

abstract class LoginRepository {
  Future<AuthSessionModel> login(LoginRequestModel request);
}
