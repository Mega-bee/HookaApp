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
        color: Colors.grey[100],
      child: Column(children: [

        receivedmod.isNotEmpty?
        Expanded(
          flex: 120,

            child: ListView.builder(
                itemCount:receivedmod.length ,
                itemBuilder: (context, index) {
                  return ReceivedCard(

                    receivedModel: receivedmod[index],Accept: (request){
                      screenstate.StatusInvite(request, receivedmod[index].id.toString());


                  } ,
                  );

                })
        ):Container(
            height: 220,
            child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("No Invitations Yet ...",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),

              ],
            ),))

      ]

      ),
    );
  }

}