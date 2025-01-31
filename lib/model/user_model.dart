// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:casheing_and_local_storage/model/handle_model.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart'; // This will be generated
@HiveType(typeId: 1) // Use a unique typeId for your model
class UserModel extends ResultModel {
   @HiveField(0)
  String name;
   @HiveField(1)
  String username;
   @HiveField(2)
  String email;
   @HiveField(3)
  String phone;
  UserModel({
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  UserModel copyWith({
    String? name,
    String? username,
    String? email,
    String? phone,
  }) {
    return UserModel(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, username: $username, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.username == username &&
      other.email == email &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      phone.hashCode;
  }
}
