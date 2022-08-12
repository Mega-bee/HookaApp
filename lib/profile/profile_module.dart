import 'package:flutter/material.dart';
import 'package:hooka/hooka_product/product_routes.dart';

import 'package:hooka/hooka_product/ui/screen/hooka_product.dart';
import 'package:hooka/hooka_product/ui/screen/prod_details.dart';
import 'package:hooka/profile/profile_routes.dart';
import 'package:hooka/profile/ui/screens/profile.dart';
import 'package:injectable/injectable.dart';

import '../abstracts/module/rout_module.dart';

@injectable
class ProfileModule extends RoutModule {
  final Profile _profile;




  ProfileModule(this._profile,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProfileRoutes.Profile: (context) => _profile,



    };
  }
}