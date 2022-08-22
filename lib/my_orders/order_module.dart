import 'package:flutter/material.dart';
import 'package:hooka/my_orders/ui/Screen/myorder.dart';
import 'package:injectable/injectable.dart';

import '../abstracts/module/rout_module.dart';
import 'order_routes.dart';

@injectable
class OrderModule extends RoutModule {
  final MyOrder _order;




  OrderModule(this._order,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      OrderRoutes.ORDER_SCREEN: (context) => _order,



    };
  }
}