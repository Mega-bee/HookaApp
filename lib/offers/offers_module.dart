import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/hooka_places/places_routes.dart';
import 'package:hooka/hooka_places/ui/screen/hooka_places.dart';
import 'package:hooka/hooka_places/ui/screen/places_details.dart';
import 'package:hooka/offers/offers_routes.dart';
import 'package:hooka/offers/widget/screen/offers.dart';
import 'package:hooka/offers/widget/screen/offers_details_screens.dart';
import 'package:injectable/injectable.dart';

@injectable
class OffersModule extends RoutModule {
  final Offers _offers;
  final OffersDetailsScreen _offersDetailsScreen;



  OffersModule(this._offers,this._offersDetailsScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      OffersRoutes.Offers: (context) => _offers,
      OffersRoutes.OffersDetails: (context) => _offersDetailsScreen,


    };
  }
}