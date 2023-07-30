// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  final int? notificationId;
  final String? notificationTitle;
  final String? notificationBody;
  final DateTime? notificationDateTime;
  final int? notificationUserId;

  NotificationModel({
    this.notificationId,
    this.notificationTitle,
    this.notificationBody,
    this.notificationDateTime,
    this.notificationUserId,
  });

  NotificationModel copyWith({
    int? notificationId,
    String? notificationTitle,
    String? notificationBody,
    DateTime? notificationDateTime,
    int? notificationUserId,
  }) =>
      NotificationModel(
        notificationId: notificationId ?? this.notificationId,
        notificationTitle: notificationTitle ?? this.notificationTitle,
        notificationBody: notificationBody ?? this.notificationBody,
        notificationDateTime: notificationDateTime ?? this.notificationDateTime,
        notificationUserId: notificationUserId ?? this.notificationUserId,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    notificationId: json["notification_id"],
    notificationTitle: json["notification_title"],
    notificationBody: json["notification_body"],
    notificationDateTime: json["notification_date_time"] == null ? null : DateTime.parse(json["notification_date_time"]),
    notificationUserId: json["notification_user_id"],
  );

  Map<String, dynamic> toJson() => {
    "notification_id": notificationId,
    "notification_title": notificationTitle,
    "notification_body": notificationBody,
    "notification_date_time": notificationDateTime?.toIso8601String(),
    "notification_user_id": notificationUserId,
  };
}
