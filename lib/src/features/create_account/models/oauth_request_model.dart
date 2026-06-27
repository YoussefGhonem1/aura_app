class OAuthRequestModel {
  const OAuthRequestModel({
    required this.username,
    required this.email,
    required this.authProvider,
  });

  final String username;
  final String email;
  final String authProvider;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'auth_provider': authProvider,
    };
  }
}
