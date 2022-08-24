import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'dart:io' as plat;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooka/invitations/ui/screen/invitations.dart';
import 'package:rxdart/rxdart.dart';

import '../global_nav_key.dart';
import '../invitations/ui/state/received_init_state.dart';

class FireNotificationService {

  static final PublishSubject<RemoteMessage> _onNotificationReceived =
  PublishSubject();

  Stream get onNotificationStream => _onNotificationReceived.stream;

  static StreamSubscription? iosSubscription;

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  ///ios permission
  Future<void> init() async {
    // LocalNotificationService.initializze();
    if (plat.Platform.isIOS) {
      await firebaseMessaging.requestPermission();
    }

    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      sound: true,
      alert: true,
      badge: true,
    );
    GetFireBaseToken();
  }

  ///receive message when app is in background solutions for on message
  static Future<dynamic> backgroundMessageHandler(RemoteMessage message) async {
    _onNotificationReceived.add(message);
    print("Bg head noti");
    return Future<void>.value();
  }

  Future<String?> GetFireBaseToken() async {
    ///TOPIC FCM
    await FirebaseMessaging.instance.subscribeToTopic('nurses');
    var token = await firebaseMessaging.getToken();
    print("firebase token: $token");
    if (token != null) {
      try {
        ///gives u the message on which user taps and opened the app when terminated state
        FirebaseMessaging.instance.getInitialMessage().then((message) {
          print(message);
          // int id = message!.data["patientId"];
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => PatientPriorityInfo()));
        });

        ///forground
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          print('forground');
          print(message.data["patientId"].toString());
          int id = int.parse(message.data["patientId"].toString());
          // Navigator.of(GlobalVariable.navState.currentContext!)
          //     .push(MaterialPageRoute(
          //         builder: (ctx) => PatientPriorityInfo(
          //               id: id,
          //             )));
          print("Patientt1");
          print(message.data["patientId"]);
          _onNotificationReceived.add(message);

          // LocalNotificationService.display(message);
        });

        ///when app is in background but opened and user taps on the notification
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          print(message);
          print(message.data["patientId"].toString());
          int id = int.parse(message.data["patientId"].toString());

          print("Patientt2");
          print(id.toString());
          //
          // Navigator.of(GlobalVariable.navState.currentContext!)
          //     .push(MaterialPageRoute(
          //     builder: (ctx) => ReceivedInitState(
          //       id: id,
          //
          //     )));

          print(message.data["patientId"]);
          // _onNotificationReceived.add(message);
        });
        FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
      } catch (e) {
        print(e.toString());
      }
    }
    return token;
  }
}
