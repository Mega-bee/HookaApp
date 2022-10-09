import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooka/map/map_routes.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../../module_deep_links/service/deep_links_service.dart';
import '../../../utils/style/colors.dart';
import '../../request/filter_places_request.dart';
import '../../request/isfav_request.dart';
import '../../state_manager/places_state_manager.dart';
@injectable
class HookaPlaces extends StatefulWidget {
  final PlacesCubit  cubit;

  HookaPlaces(this.cubit,);

  @override
  State<HookaPlaces> createState() => HookaPlacesState();
}

class HookaPlacesState extends State<HookaPlaces> {
   FilterRequest? request;
   bool Selected = false;
   bool Selected2 = false;
   bool Selected3 = false;
   String? lon ;
   String? lat ;




  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  String query = '';

  getPlacesss(FilterRequest request){
    widget.cubit.getPlacess(this, request);
  }



   isFav(IsFavorite request,String id){
     widget.cubit.IsFavo(this, request,id);
   }


  @override
  void initState() {

    super.initState();

request=FilterRequest(0, 0, "", "",[]);



    widget.cubit.getPlacess(this,request!);

  }
  ScrollController? controller;
  @override
  Widget build(BuildContext context) {
//    final _textEditingController =TextEditingController();
    return ColorfulSafeArea(
      color: Colors.white,

      bottom: false,
      left: false,
      right: false,

      child: Scaffold(

        body:NestedScrollView(
floatHeaderSlivers: true,
        controller: controller,
        headerSliverBuilder: (context,innerBoxIsScrolled){
  return [
      SliverAppBar(
        floating: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Places',style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back,color: Primarycolor,size: 25,),
          onPressed: (){Navigator.of(context).pop();},

        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pushNamed(context, MapRoutes.MAP_SCREEN ,arguments:'places');

          }, child: Text("Map",style:  GoogleFonts.comfortaa(fontSize: 15,fontWeight: FontWeight.bold),))
        ],
      )

  ];
      },

        body:   BlocBuilder<PlacesCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        )
      )),
    );
  }

}



