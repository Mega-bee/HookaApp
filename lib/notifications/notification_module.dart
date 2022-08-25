import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/notifications/ui/screen/notifications.dart';
import 'package:injectable/injectable.dart';

import 'notifications_routes.dart';

@injectable
class NotificationsModule extends RoutModule {
  final Notifications _notifications;



  NotificationsModule(this._notifications,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      NotificationsRoutes.NOTIFICATIONS_SCREEN: (context) => _notifications,


    };
  }
}