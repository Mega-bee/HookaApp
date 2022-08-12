import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/hooka_buddies/request/invite_request.dart';
import 'package:hooka/hooka_buddies/ui/state/invite_init_state.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../state_manager/Buddies_state_manager.dart';

@injectable
class InviteBuddies extends StatefulWidget {
  final BuddiesCubit cubit;

  InviteBuddies(this.cubit);

  @override
  State<InviteBuddies> createState() => InviteBuddiesState();
}

class InviteBuddiesState extends State<InviteBuddies> {

  DateTime inviteDate = DateTime.now();
  TimeOfDay inviteTime = TimeOfDay.now();
  late AsyncSnapshot loadingSnapshot;
  bool flags = true;
  int? toBuddyId;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  sendInvite(InviteRequest request){
    widget.cubit.sendInvitation(this , request);
  }

  @override
  void initState() {
    super.initState();
    widget.cubit.getOptionInv(this);
    loadingSnapshot = AsyncSnapshot.nothing();
    widget.cubit.loadingStream.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshot = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is int) {
      toBuddyId = args;
      }
      flags = false;
    }
    return  Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'invite',
          style: TextStyle(color: Primarycolor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Primarycolor,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ),
      body: BlocBuilder<BuddiesCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
