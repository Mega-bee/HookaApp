
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
                    })))
      ]

      ),
    );
  }
}