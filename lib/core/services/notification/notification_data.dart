import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationData {
  final String title;
  final String body;
  final Map<String, dynamic> data;

  NotificationData({
    required this.title,
    required this.body,
    required this.data,
  });

  factory NotificationData.fromRemoteMessage(RemoteMessage message) {
    final notification = message.notification;
    final data = message.data;

    return NotificationData(
      title: notification?.title ?? '',
      body: notification?.body ?? '',
      data: data,
    );
  }
}
