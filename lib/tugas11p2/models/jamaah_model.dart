import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class JamaahModel {
  int? id;
  String nama;
  String email;
  String noHp;
  String alamat;
  JamaahModel({
    this.id,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'email': email,
      'noHp': noHp,
      'alamat': alamat,
    };
  }

  factory JamaahModel.fromMap(Map<String, dynamic> map) {
    return JamaahModel(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      email: map['email'] as String,
      noHp: map['noHp'] as String,
      alamat: map['alamat'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JamaahModel.fromJson(String source) =>
      JamaahModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
