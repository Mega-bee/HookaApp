import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/hooka_places/places_routes.dart';
import 'package:hooka/hooka_places/ui/screen/hooka_places.dart';
import 'package:hooka/hooka_places/ui/screen/places_details.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlacesModule extends RoutModule {
  final HookaPlaces _hookaPlaces;
  final PlacesDetails _details;


  PlacesModule(this._hookaPlaces,this._details) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      PlacesRoutes.Places: (context) => _hookaPlaces,
      PlacesRoutes.Details: (context) => _details,

    };
  }
}