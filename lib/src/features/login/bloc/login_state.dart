import '../models/user_model.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState {
  const LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.status = LoginStatus.initial,
    this.user,
    this.token,
    this.message,
  });

  final String email;
  final String password;
  final bool isPasswordVisible;
  final LoginStatus status;
  final UserModel? user;
  final String? token;
  final String? message;

  bool get isSubmitting => status == LoginStatus.loading;

  bool get isSuccess => status == LoginStatus.success;

  bool get isFailure => status == LoginStatus.failure;

  bool get canSubmit => email.trim().isNotEmpty && password.trim().isNotEmpty;

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    LoginStatus? status,
    UserModel? user,
    String? token,
    String? message,
    bool clearUser = false,
    bool clearToken = false,
    bool clearMessage = false,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
      user: clearUser ? null : user ?? this.user,
      token: clearToken ? null : token ?? this.token,
      message: clearMessage ? null : message ?? this.message,
    );
  }
}
