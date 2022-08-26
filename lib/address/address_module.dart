import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/address/address_routes.dart';
import 'package:hooka/address/ui/screen/Address_screen.dart';
import 'package:hooka/checkout/ui/screen/checkout.dart';
import 'package:injectable/injectable.dart';


@injectable
class AddressModule extends RoutModule {
  final AddresScreen addresScreen;


  AddressModule(this.addresScreen ,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AddressRoutes.Address_screen: (context) =>addresScreen,

    };
  }
}
