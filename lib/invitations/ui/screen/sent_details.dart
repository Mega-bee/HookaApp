import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../state_manager/sent_state_manager.dart';

@injectable
class SentDetails extends StatefulWidget {
  final SentInvitationCubit cubit;
  SentDetails(this.cubit);

  @override
  State<SentDetails> createState() => SentDetailsState();
}

class SentDetailsState extends State<SentDetails>
    with AutomaticKeepAliveClientMixin {
  bool flags = true;

  @override
  Widget build(BuildContext context) {
    if (flags) {
      var args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is String) {
        widget.cubit.getDetailsSentInv(this, args);
      }
      flags = false;
    }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
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
          title: Text(
            "Sent Invitation Details ",
            style: TextStyle(color: Primarycolor),
          ),
        ),
        body: BlocBuilder<SentInvitationCubit, States>(
            bloc: widget.cubit,
            builder: (context, state) {
              return state.getUI(context);
            }));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
