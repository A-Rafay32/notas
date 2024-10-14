// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:notas/core/enums/gender.dart';
import 'package:notas/features/auth/model/user_details.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? password;
  final String? image;
  final String? bio;

  UserModel({
    required this.name,
    required this.email,
    this.password,
    this.image,
    this.bio,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'image': image,
      'bio': bio,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
