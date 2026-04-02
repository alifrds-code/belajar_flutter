class ProfileModel {
  final String? message;
  final ProfileData? data;

  ProfileModel({this.message, this.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

class ProfileData {
  final int? id;
  final String? name;
  final String? email;
  final String? emailVerifiedAt; // <--- Ini tambahannya
  final String? createdAt;
  final String? updatedAt;

  ProfileData({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    emailVerifiedAt:
        json['email_verified_at'] as String?, // <--- Ini nangkepnya
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );
}
