import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/settings/setting_routes.dart';
import 'package:hooka/settings/ui/about.dart';
import 'package:hooka/settings/ui/settings.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingModule extends RoutModule {
  final Settings _settings;
  final About _about;

  SettingModule(this._settings , this._about) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      SettingRoutes.SETTING_SCREEN: (context) =>_settings,
      SettingRoutes.ABOUT_SCREEN: (context) =>_about,
    };
  }
}
