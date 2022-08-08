import 'package:flutter/material.dart';
import 'package:hooka/offers/response/offers_response.dart';
import 'package:hooka/offers/widget/ui/offers_card.dart';

import '../../../abstracts/states/state.dart';
import '../screen/offers.dart';
import '../screen/offers_details_screens.dart';

class OfferInitState extends States{
  final  List<OffersResponse> offersResponse;
  final OffersState offersState;
  OfferInitState(this.offersState,{required this.offersResponse});


  @override
  Widget getUI(BuildContext context) {
 return   SingleChildScrollView(
   child: Padding(
     padding: const EdgeInsets.all(20.0),
     child: GridView.builder(
         physics: NeverScrollableScrollPhysics(),
         shrinkWrap: true,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             childAspectRatio: (4 / 4),
             crossAxisSpacing: 50,
             mainAxisSpacing: 30),
         itemCount: offersResponse.length,
         itemBuilder: (context, index) {
           final OffersList = offersResponse[index];
           return OffersCard(OffersList);

         }),
   ),
 );
  }

}