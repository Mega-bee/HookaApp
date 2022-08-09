import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/invitations/ui/widget/sent_card.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../model/sent_model.dart';
import '../../state_manager/sent_state_manager.dart';

@injectable
class SentTab extends StatefulWidget {
  final SentInvitationCubit cubit;
  SentTab(this.cubit);


  @override
  State<SentTab> createState() => SentTabState();
}

class SentTabState extends State<SentTab> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getSentInv(this);

  }

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<SentInvitationCubit, States>(
          bloc: widget.cubit,
          builder: (context, state)
          {
            return state.getUI(context);}
      ); }

}
