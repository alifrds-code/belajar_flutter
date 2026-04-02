class AuthModel {
  final String? message;
  final AuthData? data;

  AuthModel({this.message, this.data});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : AuthData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

class AuthData {
  final String? token;
  final UserData? user;

  AuthData({this.token, this.user});

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
    token: json['token'] as String?,
    user: json['user'] == null
        ? null
        : UserData.fromJson(json['user'] as Map<String, dynamic>),
  );
}

class UserData {
  final int? id;
  final String? name;
  final String? email;
  final String? emailVerifiedAt; // <--- Ini tambahannya
  final String? createdAt;
  final String? updatedAt;

  UserData({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    emailVerifiedAt:
        json['email_verified_at'] as String?, // <--- Ini nangkepnya
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );
}
