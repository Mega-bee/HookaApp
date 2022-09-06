
import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';
import '../../response/notification_response.dart';
import '../screen/notifications.dart';
import '../widget/notificationsCard.dart';

class NotificationInitState extends States{
  final NotificationsState notificationsState;
  final List<NotificationsResponse> notificationsResponse;
  NotificationInitState(this.notificationsResponse,this.notificationsState);

  @override
  Widget getUI(BuildContext context) {
    return Container(
      child: Column(children: [

       notificationsResponse.isNotEmpty?
        Expanded(
            flex: 100,
            child: Card(

                child: ListView.builder(
                    itemCount: notificationsResponse.length,
                    itemBuilder: (context, index) {
                      final mod =notificationsResponse[index];
                      return Notificationscard(
                        mod
                      );
                    }))):Container(
    height: 220,
    child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Text("No notifications Yet ... ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),])))
      ]

      ),
    );
  }
}