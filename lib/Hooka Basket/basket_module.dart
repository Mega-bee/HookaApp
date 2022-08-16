import 'package:flutter/material.dart';
import 'package:hooka/Hooka%20Basket/basket_routes.dart';
import 'package:hooka/Hooka%20Basket/ui/screen/basket_screen.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/hooka_buddies/ui/screens/buddies.dart';
import 'package:hooka/hooka_buddies/ui/screens/invite.dart';
import 'package:hooka/hooka_buddies/ui/screens/view_profile.dart';
import 'package:injectable/injectable.dart';


@injectable
class BasketModule extends RoutModule {
  final BasketScreen _basketScreen;





  BasketModule(this._basketScreen,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      BasketRoutes.BasketS: (context) => _basketScreen,



    };
  }
}