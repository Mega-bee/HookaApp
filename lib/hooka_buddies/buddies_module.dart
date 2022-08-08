import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/hooka_buddies/ui/screens/buddies.dart';
import 'package:injectable/injectable.dart';

import 'buddies_routes.dart';

@injectable
class BuddiesModule extends RoutModule {
  final Buddies _buddies;



  BuddiesModule(this._buddies) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      BuddiesRoutes.Buddies: (context) => _buddies,


    };
  }
}