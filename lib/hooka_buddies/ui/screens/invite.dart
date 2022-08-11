import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    widget.cubit.getOptionInv(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
        body: BlocBuilder<BuddiesCubit, States>(
      bloc: widget.cubit,
      builder: (context, state) {
        return state.getUI(context);
      },
    ));
  }
}
