import 'package:aura_app/src/features/login/models/user_model.dart';

enum CreateAccountStatus { initial, loading, success, failure }

class CreateAccountState {
  const CreateAccountState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.isAcceptedTerms = false,
    this.isPasswordVisible = false,
    this.status = CreateAccountStatus.initial,
    this.user,
    this.token,
    this.message,
  });

  final String username;
  final String email;
  final String password;
  final bool isAcceptedTerms;
  final bool isPasswordVisible;
  final CreateAccountStatus status;
  final UserModel? user;
  final String? token;
  final String? message;

  bool get isSubmitting => status == CreateAccountStatus.loading;

  bool get isSuccess => status == CreateAccountStatus.success;

  bool get isFailure => status == CreateAccountStatus.failure;

  bool get canSubmit {
    return username.trim().isNotEmpty &&
        email.trim().isNotEmpty &&
        password.trim().isNotEmpty &&
        isAcceptedTerms;
  }

  CreateAccountState copyWith({
    String? username,
    String? email,
    String? password,
    bool? isAcceptedTerms,
    bool? isPasswordVisible,
    CreateAccountStatus? status,
    UserModel? user,
    String? token,
    String? message,
    bool clearUser = false,
    bool clearToken = false,
    bool clearMessage = false,
  }) {
    return CreateAccountState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      isAcceptedTerms: isAcceptedTerms ?? this.isAcceptedTerms,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
      user: clearUser ? null : user ?? this.user,
      token: clearToken ? null : token ?? this.token,
      message: clearMessage ? null : message ?? this.message,
    );
  }
}
