import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/hooka_buddies/ui/screens/buddies.dart';
import 'package:hooka/hooka_buddies/ui/screens/invite.dart';
import 'package:hooka/hooka_buddies/ui/screens/view_profile.dart';
import 'package:injectable/injectable.dart';

import 'buddies_routes.dart';

@injectable
class BuddiesModule extends RoutModule {
  final Buddies _buddies;
  final InviteBuddies _inviteBuddies;
  final ViewProfileBuddie _profileBuddie;




  BuddiesModule(this._buddies,this._inviteBuddies,this._profileBuddie) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      BuddiesRoutes.Buddies: (context) => _buddies,
      BuddiesRoutes.InvitOp: (context) => _inviteBuddies,
      BuddiesRoutes.PROFBUDDIES: (context) => _profileBuddie,


    };
  }
}