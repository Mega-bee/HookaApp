import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../request/status_inv_request.dart';
import '../../state_manager/invitation_state_manager.dart';

@injectable
class ReceivedTab extends StatefulWidget {
  final RecInvitationCubit cubit;
  ReceivedTab(this.cubit);

  @override
  State<ReceivedTab> createState() => ReceivedTabState();
}

class ReceivedTabState extends State<ReceivedTab> with AutomaticKeepAliveClientMixin {
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  StatusInvite(StatusInvRequest request,String id){
    widget.cubit.StatusInv(this, request,id);
  }

  @override
  void initState() {
    super.initState();
    widget.cubit.getReceivedInv(this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecInvitationCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
