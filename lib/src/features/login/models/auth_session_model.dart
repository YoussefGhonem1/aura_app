import 'user_model.dart';

class AuthSessionModel {
  const AuthSessionModel({
    required this.message,
    required this.token,
    required this.user,
  });

  final String message;
  final String token;
  final UserModel user;

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    return AuthSessionModel(
      message: json['message']?.toString() ?? '',
      token: json['token']?.toString() ?? '',
      user: userJson is Map<String, dynamic>
          ? UserModel.fromJson(userJson)
          : const UserModel(id: 0, username: '', email: ''),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
      'token': token,
      'user': user.toJson(),
    };
  }
}
