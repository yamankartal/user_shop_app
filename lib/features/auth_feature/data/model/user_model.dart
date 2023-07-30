// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final int? userId;
  final String? userName;
  final String? userEmail;
  final String? userPassword;
  final int? userPhone;
  final int? userApprove;
  final DateTime? userCreateTime;
  final String? userImage;
  final int? userVerifyCode;

 const UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.userPhone,
    this.userApprove,
    this.userCreateTime,
    this.userImage,
    this.userVerifyCode,
  });

  UserModel copyWith({
    int? userId,
    String? userName,
    String? userEmail,
    String? userPassword,
    int? userPhone,
    int? userApprove,
    DateTime? userCreateTime,
    String? userImage,
    int? userVerifyCode,
  }) =>
      UserModel(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        userEmail: userEmail ?? this.userEmail,
        userPassword: userPassword ?? this.userPassword,
        userPhone: userPhone ?? this.userPhone,
        userApprove: userApprove ?? this.userApprove,
        userCreateTime: userCreateTime ?? this.userCreateTime,
        userImage: userImage ?? this.userImage,
        userVerifyCode: userVerifyCode ?? this.userVerifyCode,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["user_id"],
    userName: json["user_name"],
    userEmail: json["user_email"],
    userPassword: json["user_password"],
    userPhone: json["user_phone"],
    userApprove: json["user_approve"],
    userCreateTime: json["user_create_time"] == null ? null : DateTime.parse(json["user_create_time"]),
    userImage: json["user_image"],
    userVerifyCode: json["user_verify_code"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
    "user_email": userEmail,
    "user_password": userPassword,
    "user_phone": userPhone,
    "user_approve": userApprove,
    "user_create_time": userCreateTime?.toIso8601String(),
    "user_image": userImage,
    "user_verify_code": userVerifyCode,
  };
}
