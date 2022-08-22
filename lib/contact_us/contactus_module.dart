import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/contact_us/contactus_routes.dart';
import 'package:hooka/contact_us/ui/contactus.dart';
import 'package:injectable/injectable.dart';

@injectable
class ContactUsSModule extends RoutModule {
  final ScreenContactus _contactusScreen;


  ContactUsSModule(this._contactusScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ContactUsRoutes.CONTACT_US_SCREEN: (context) =>_contactusScreen,

    };
  }
}
