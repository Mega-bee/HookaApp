import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/home_page/home_routes.dart';
import 'package:hooka/home_page/ui/screens/drawer_screen.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeModule extends RoutModule {
  final DrawerScreen _mainScreen;

  HomeModule(this._mainScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      HomeRoutes.HOME_SCREEN: (context) =>_mainScreen,
    };
  }
}
