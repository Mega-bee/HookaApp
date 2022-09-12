import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/offers/response/offers_response.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:hooka/utils/style/text_style.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../state_manager/offers_state_manager.dart';
import 'offers_details_screens.dart';
@injectable
class Offers extends StatefulWidget {
  final OffersCubit  cubit;
  Offers(this.cubit);



  @override
  State<Offers> createState() => OffersState();
}

class OffersState extends State<Offers> {
  late List<OffersResponse> placesModel;
  @override
  void initState() {
    super.initState();
    widget.cubit.getOffers(this);

  }


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
          backgroundColor: Colors.white,

        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
            onPressed: (){Navigator.of(context).pop();},
          ),
          title: Text("Offers",style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold)),
          elevation: 1,
backgroundColor: Colors.white,
        ),
        body:BlocBuilder<OffersCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        )
      ),
    );
     

  }
}
