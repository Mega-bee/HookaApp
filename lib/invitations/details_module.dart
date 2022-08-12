import 'package:flutter/material.dart';
import 'package:hooka/hooka_product/product_routes.dart';

import 'package:hooka/hooka_product/ui/screen/hooka_product.dart';
import 'package:hooka/hooka_product/ui/screen/prod_details.dart';
import 'package:hooka/invitations/ui/screen/sent_details.dart';
import 'package:injectable/injectable.dart';

import '../abstracts/module/rout_module.dart';
import 'details_routes.dart';

@injectable
class DetailsInvModule extends RoutModule {
  final SentDetails _sentDetails;




  DetailsInvModule(this._sentDetails,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      DetailsInvRoutes.SentInvDetails: (context) => _sentDetails,



    };
  }
}