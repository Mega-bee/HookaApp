import 'dart:convert';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

import '../invitations/details_routes.dart';




class LocalNotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final PublishSubject<String> _onNotificationReceived =
      PublishSubject();

  Stream get onLocalNotificationStream => _onNotificationReceived.stream;

  Future<void> init() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/ic_launcher");

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(requestSoundPermission: true);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  void showNotification(RemoteMessage message) {
    RemoteNotification notification = message.notification!;
    IOSNotificationDetails iOSPlatformChannelSpecifics =
        const IOSNotificationDetails();

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
          "hooka",
          "hooka",
      // 'Showing notifications while the app running',
      importance: Importance.max,
      priority: Priority.max,
      showWhen: true,
      playSound: true,
      channelShowBadge: true,
      enableLights: true,
      enableVibration: true,
      onlyAlertOnce: false,
      category: 'Local',
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    flutterLocalNotificationsPlugin.show(
        int.tryParse(message.messageId ?? '1') ?? Random().nextInt(1000000),
        notification.title,
        notification.body,
        platformChannelSpecifics,
        payload: json.encode(message.data));
  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      var message = jsonDecode(payload);
      print(message);
      if(message.data["inviteId"] != null){
        int id = int.parse(message.data["inviteId"].toString());
        // Navigator.pushNamed(context, routeName);
      }
      else if (message.data["orderid"] != null ) {
        int idd = int.parse(message.data["orderId"].toString());

        // Navigator.pushNamed(context, routeName);
      }
      // Navigator.of(GlobalVariable.navState.currentContext!)
      //     .push(MaterialPageRoute(
      //     builder: (ctx) => Invit(
      //       id: id,
      //       firstname: firstName,
      //       midleName: middletName,
      //       lastName: lastName,
      //     )));
      print('onSelected');
      print(payload);
      // var data =payload;
      _onNotificationReceived.add(payload);
    }
  }
}
