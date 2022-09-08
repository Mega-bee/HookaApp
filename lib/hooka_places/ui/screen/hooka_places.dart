import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/map/map_routes.dart';
import 'package:hooka/map/ui/screen/map_screen.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../request/filter_places_request.dart';
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
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  String query = '';

  getPlacesss(){
    widget.cubit.getPlacess(this, request!);
  }

  @override
  void initState() {
    super.initState();
    request=FilterRequest(1);
    widget.cubit.getPlacess(this,request!);
  }
  @override
  Widget build(BuildContext context) {
//    final _textEditingController =TextEditingController();
    return Scaffold(

      appBar:AppBar(

        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Places',style: TextStyle(color: Primarycolor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},

        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pushNamed(context, MapRoutes.MAP_SCREEN ,arguments:'places');

          }, child: Text("Map",style: TextStyle(fontSize: 18),))
        ],
      ) ,
      body:   BlocBuilder<PlacesCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      )
    );
  }

}



