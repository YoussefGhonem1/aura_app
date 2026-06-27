class RegisterRequestModel {
  const RegisterRequestModel({
    required this.username,
    required this.email,
    required this.password,
    required this.acceptedTerms,
  });

  final String username;
  final String email;
  final String password;
  final bool acceptedTerms;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'accepted_terms': acceptedTerms,
    };
  }
}
