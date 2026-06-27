class UserModel {
  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.balance,
    this.acceptedTerms,
    this.authProvider,
    this.createdAt,
  });

  final int id;
  final String username;
  final String email;
  final double? balance;
  final bool? acceptedTerms;
  final String? authProvider;
  final DateTime? createdAt;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: _readInt(json['id']),
      username: json['username']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      balance: _readDoubleOrNull(json['balance']),
      acceptedTerms: _readBoolOrNull(json['accepted_terms']),
      authProvider: json['auth_provider']?.toString(),
      createdAt: _readDateTimeOrNull(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'balance': balance,
      'accepted_terms': acceptedTerms,
      'auth_provider': authProvider,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  static int _readInt(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  static double? _readDoubleOrNull(dynamic value) {
    if (value is double) {
      return value;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }

  static bool? _readBoolOrNull(dynamic value) {
    if (value is bool) {
      return value;
    }
    return null;
  }

  static DateTime? _readDateTimeOrNull(dynamic value) {
    if (value is DateTime) {
      return value;
    }
    if (value is String) {
      return DateTime.tryParse(value);
    }
    return null;
  }
}
