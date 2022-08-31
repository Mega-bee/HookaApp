import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../hooka_places/request/filter_places_request.dart';
import '../../state_manager/map_state_manager.dart';

@injectable
class LocationMap extends StatefulWidget {
  final MapCubit cubit;
  LocationMap(this.cubit);
  @override
  LocationMapState createState() => LocationMapState();
}

class LocationMapState extends State<LocationMap> {
  Completer<GoogleMapController> controllerGoo = Completer();
  CustomInfoWindowController? customInfoWindowController;
  FilterRequest? request;
  bool flags = true;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void onMapCreated(GoogleMapController controller) {
    customInfoWindowController?.googleMapController = controller;
    controllerGoo.complete(controller);
  }

  getPlaces (){
    widget.cubit.getPlacess(this, request!);
  }
  getBuddies(){
    widget.cubit.getBuddies(this);
  }

  @override
  void initState() {
    super.initState();
    customInfoWindowController = CustomInfoWindowController();
    request = FilterRequest(0);
  }

  @override
  Widget build(BuildContext context) {
    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is String) {
        if(args =='places') {
          getPlaces();
        }else{
          getBuddies();
        }
      }
      flags = false;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Hooka Map',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<MapCubit, States>(
            bloc: widget.cubit,
            builder: (context, state) {
              return state.getUI(context);
            }));
  }
}
