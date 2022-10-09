import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/hooka_places/request/isfav_request.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';

import '../../../utils/style/colors.dart';
import '../../places_routes.dart';
import '../../request/addreview_request.dart';
import '../../state_manager/details_state_manager.dart';
@injectable
class PlacesDetails extends StatefulWidget {
  final DetailsCubit  cubit;

  PlacesDetails(this.cubit,);



  @override
  State<PlacesDetails> createState() => PlacesDetailsState();
}

class PlacesDetailsState extends State<PlacesDetails> {
  bool flags = true;
  ScrollController? controller1;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }


  isFav(IsFavorite request,String id){
    widget.cubit.IsFavo(this, request,id);
  }
  AddReviewww(AddReviewReq request,String id){
    widget.cubit.AddReviewstate(this, request,id);
  }
  late int currentIndex;

  List<String>   imagesUrl= [];
  List<String>   imagesUrl1= [];
@override
void initState() {

    super.initState();
    currentIndex = 0;

  }



  @override
  Widget build(BuildContext context) {
  String? f;
    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is String) {
        widget.cubit.getDetails(this,args);
         f=args;
      }
      flags = false;
    }
    return  ColorfulSafeArea(
      color: Colors.white,

      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:NestedScrollView(
      floatHeaderSlivers: true,
      controller: controller1,
      headerSliverBuilder: (context,innerBoxIsScrolled){
    return [


        SliverAppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
              color: Primarycolor,
              size: 25,
            ),
            onPressed: () {
          Navigator.pop(context);


            },
          ),
          title: Text(
            "Details",
            style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold),
          ),
          actions: [

          ],)];},

        body:  BlocBuilder<DetailsCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        )
      ),
    ));
  }
}
