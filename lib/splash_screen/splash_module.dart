import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/splash_screen/splash_routes.dart';

import 'package:hooka/splash_screen/ui/splash_screen.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashModule extends RoutModule {
  final SplashScreen _splashScreen;

  SplashModule(this._splashScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      SplashRoutes.SPLASH_SCREEN: (context) => _splashScreen,
    };
  }
}
