import 'dart:io';
import 'dart:math';

import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:test_signalr_flutter/local_notifacation_helper.dart';

const String BASE_URL = 'http://192.168.1.2:5050/api/';
const String Token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEyMzQ1Njc4OTEiLCJlbWFpbCI6IjEyMzQ1Njc4OTFAbnZnLmdvdi5zYSIsIm5hbWVpZCI6IjU3ZDUyMzE4LTgxMTMtNDk2Ni1hN2Q3LWQ1ODdkMjViZjkyOSIsIkVudGl0eV9JZCI6IiIsIkVudGl0eV9OYW1lQXIiOiIiLCJFbnRpdHlfTmFtZUVuIjoiIiwiZXhwIjoxNjQ1NzA0MDc5LCJpc3MiOiJOUFZXLmNvbSIsImF1ZCI6Ik5QVlcuY29tIn0.FriHhX0UTZjx0GgkjvdQj2EVXht49VDcMfyc8_YKSlA";

class SignalRHelper {
  static final connection = HubConnectionBuilder().withUrl(
      BASE_URL + 'notificationsHub/',
          HttpConnectionOptions(
            client: IOClient(HttpClient()..userAgent),
            accessTokenFactory: () async => Token,
            logging: (level, message) => print(message),
          )).build();

  /// connection Start SignalR
  static init() async {
    await connection
        .start()!
        .then((value) => print("Connection SignalR Start !"))
        .catchError((onError) => print("onError SignalR Start => $onError"));
  }

  static connectionOn() {
    connection.on('ReceiveNotification', (message) {
      print(message!.first.toString());
      print('message ====> ${message.first}');
      LocalNotificationHelper.showNotification(
id:  Random().nextInt(1000),
          title: 'message', body: "body", payload: "payload");
    });
  }

}
