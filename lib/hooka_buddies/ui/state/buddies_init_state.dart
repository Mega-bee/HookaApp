

import 'package:flutter/material.dart';
import 'package:hooka/hooka_buddies/response/buddies_response.dart';
import '../../../abstracts/states/state.dart';
import '../../Model/BuddiesModel.dart';
import '../screens/buddies.dart';
import '../widget/SearchWidgetBuddies.dart';
import '../widget/buddies_card.dart';

class BuddiesInitState extends States{
  final List<BuddiesResp> buddresp;
  final BuddiesState buddiesState;
  BuddiesInitState(this.buddiesState,this.buddresp);


  String query = '';
  @override
  Widget getUI(BuildContext context) {
    return  Column(
        children:[
          SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: SearchWidgetBuddies(
                hintText: "Search",
                // onChanged: searchBuddies,
                text: query, onChanged: (String value) {  },
              ) ),
          SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),

          Expanded(
            child: Card(

                child: ListView.builder(
                    itemCount: buddresp.length,
                    itemBuilder: (context, index) {
                      final BuddiesList = buddresp[index];
                      return BuddiesCard(BuddiesList);
                    })),






          )




        ]);
  }

}