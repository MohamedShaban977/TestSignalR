
import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class LocalNotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();

  static final onNotification = BehaviorSubject<String>();

  static Future init() async {
    final iOS = IOSInitializationSettings();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettings =
        InitializationSettings(android: android, iOS: iOS);
    await _notification.initialize(initializationSettings,

        onSelectNotification: (payload) async {
      onNotification.add(payload!);
    });
  }

  static Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    _notification.show(id, title, body, await _notificationDetails(),
        payload: payload);
  }

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: "channel description",
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        vibrationPattern: Int64List(6),
        enableLights: true,
        enableVibration: true,
      ),
      iOS: IOSNotificationDetails(
          presentSound: true, presentAlert: true, presentBadge: true),
    );
  }

  static listenNotification()async =>
      onNotification.stream.listen(onClickNotification);

  static onClickNotification(String payload){}

}
