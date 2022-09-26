import 'package:flutter/material.dart';
import 'package:hooka/utils/style/colors.dart';
import '../../../abstracts/states/state.dart';
import '../../../hooka_buddies/buddies_routes.dart';
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
      color: Colors.grey[100],
      child: Column(children: [

       sentdmod.isNotEmpty?
        Expanded(
            flex: 100,
            child: ListView.builder(
                itemCount:sentdmod.length,
                itemBuilder: (context, index) {
                  return SentCard(senttttModel: sentdmod[index],);
                })):Container(
    height: 220,
    child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Text("No Invitations Yet ... To Invite People",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
    InkWell(
      onTap: (){
        Navigator.pushNamed(context, BuddiesRoutes.Buddies);
      },
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("View Buddies",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
            Icon(Icons.person,color: YellowColor,size: 20,)
          ],
        )),

    ]),))


    ]

      ),
    );
  }

}