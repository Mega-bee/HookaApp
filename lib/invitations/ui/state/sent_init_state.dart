import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';
import '../../response/sent_invitation_response.dart';
import '../screen/sent_tab.dart';
import '../widget/sent_card.dart';

class SentInitState extends States{
  final List<SentInvitationResponse> sentdmod;
  final SentTabState screenstate;
  SentInitState(this.sentdmod,this.screenstate);
  @override
  Widget getUI(BuildContext context) {
    return  Container(
      child: Column(children: [
        Expanded(
            flex: 100,
            child: Card(

                child: ListView.builder(
                    itemCount:sentdmod.length,
                    itemBuilder: (context, index) {
                      return SentCard(senttttModel: sentdmod[index],);
                    })))]

      ),
    );
  }

}