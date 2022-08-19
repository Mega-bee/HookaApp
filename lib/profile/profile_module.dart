import 'package:flutter/material.dart';
import 'package:hooka/hooka_product/product_routes.dart';

import 'package:hooka/hooka_product/ui/screen/hooka_product.dart';
import 'package:hooka/hooka_product/ui/screen/prod_details.dart';
import 'package:hooka/profile/profile_routes.dart';
import 'package:hooka/profile/ui/edit_profile.dart';
import 'package:hooka/profile/ui/screens/profile.dart';
import 'package:injectable/injectable.dart';

import '../abstracts/module/rout_module.dart';

@injectable
class ProfileModule extends RoutModule {
  final Profile _profile;
  final EditProfile _editProfile;




  ProfileModule(this._profile,this._editProfile) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProfileRoutes.Profile: (context) => _profile,
      ProfileRoutes.Edit: (context) => _editProfile,



    };
  }
}