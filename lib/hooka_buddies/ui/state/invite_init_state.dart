import '../../../abstracts/states/state.dart';
import 'package:flutter/material.dart';

import '../../response/invitation_options_response.dart';
import '../screens/invite.dart';
import '../widget/invopt_card.dart';
class InviteInitState extends States{
  final List<InvitationOptionsResponse> invoptionresp;
  final InviteBuddiesState buddiesState;
  InviteInitState(this.buddiesState,this.invoptionresp,);

  @override
  Widget getUI(BuildContext context) {
return
    Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                height:200,
                child: ListView.builder(
                    itemCount: invoptionresp.length,
                    itemBuilder: (context, index) {
                      final BuddiesList = invoptionresp[index];
                      return InvOptionCard(BuddiesList);

                    }),
              )


              // CheckboxListTile(value: value, onChanged: onChanged)
            ],
          ),
        )
      ],
    );

  }

}