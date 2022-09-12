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
 return   Container(
   height: 900,
   decoration: BoxDecoration(

     gradient: LinearGradient(
       colors: [
         Colors.white,
         Color.fromRGBO(211,211,211, 0.9),
       ],
       begin:  FractionalOffset(0.0, 0.0),
       end:  FractionalOffset(0.0, 1.0),
       stops: [0.4, 1.0],
       tileMode: TileMode.repeated,

     ),
   ),
   child: SingleChildScrollView(
     child: Padding(
       padding: const EdgeInsets.all(20.0),
       child:
       GridView.builder(
           physics:const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               childAspectRatio: (4/4),

               crossAxisSpacing: 10,
               mainAxisSpacing: 10),
           itemCount: offersResponse.length,
           itemBuilder: (context, index) {
             final OffersList = offersResponse[index];
             return OffersCard(OffersList);

           }),
     ),
   ),
 );
  }

}