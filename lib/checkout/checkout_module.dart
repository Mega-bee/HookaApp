import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/checkout/ui/screen/checkout.dart';
import 'package:injectable/injectable.dart';

import 'checkout_routes.dart';

@injectable
class CheckoutModule extends RoutModule {
  final Checkout _checkout;


  CheckoutModule(this._checkout ,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      CheckoutRoutes.Checkout_screen: (context) =>_checkout,

    };
  }
}
