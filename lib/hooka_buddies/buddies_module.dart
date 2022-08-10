import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/hooka_buddies/ui/screens/buddies.dart';
import 'package:hooka/hooka_buddies/ui/screens/invite.dart';
import 'package:injectable/injectable.dart';

import 'buddies_routes.dart';

@injectable
class BuddiesModule extends RoutModule {
  final Buddies _buddies;
  final InviteBuddies _inviteBuddies;



  BuddiesModule(this._buddies,this._inviteBuddies) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      BuddiesRoutes.Buddies: (context) => _buddies,
      BuddiesRoutes.InvitOp: (context) => _inviteBuddies,


    };
  }
}