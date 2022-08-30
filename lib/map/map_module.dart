import 'package:flutter/material.dart';
import 'package:hooka/map/ui/screen/map_screen.dart';

import 'package:injectable/injectable.dart';

import '../abstracts/module/rout_module.dart';
import 'map_routes.dart';

@injectable
class MapModule extends RoutModule {
  final LocationMap _locationMap;





  MapModule(this._locationMap,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
    MapRoutes.MAP_SCREEN: (context) => _locationMap,




    };
  }
}