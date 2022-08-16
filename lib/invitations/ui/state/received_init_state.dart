import 'package:flutter/material.dart';

import '../../../../abstracts/states/state.dart';
import '../../response/received_invitation_response.dart';
import '../screen/received_tab.dart';
import '../widget/received_card.dart';

class ReceivedInitState extends States{
  final List<ReceivedInvitationResponse> receivedmod;
  final ReceivedTabState screenstate;
  ReceivedInitState(this.receivedmod,this.screenstate);
  @override
  Widget getUI(BuildContext context) {
 return
      Container(
      child: Column(children: [
        Expanded(
          flex: 100,
            child: Card(

                child: ListView.builder(
                    itemCount:receivedmod.length ,
                    itemBuilder: (context, index) {
                      return ReceivedCard(
                        receivedModel: receivedmod[index],Accept: (request){
                          screenstate.StatusInvite(request, receivedmod[index].id.toString());
                      } ,
                      );

                    })))]

      ),
    );
  }

}