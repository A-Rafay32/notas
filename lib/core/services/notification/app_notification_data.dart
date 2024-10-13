import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppNotificationData {
  static const channel = AndroidNotificationChannel(
    'homequest_channel',
    'HomeQuest Notifications',
    description:
        'This channel is used for foreground notifications of HomeQuest App.',
    importance: Importance.max,
  );
  static final notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      icon: "@mipmap/ic_launcher",
    ),
  );
}
