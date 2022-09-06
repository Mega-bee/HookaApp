
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooka/hooka_buddies/buddies_routes.dart';
import 'package:hooka/hooka_buddies/response/buddies_response.dart';
import 'package:hooka/hooka_places/places_routes.dart';

import '../../../abstracts/states/state.dart';
import '../../../hooka_places/response/places_response.dart';
import '../../../utils/style/colors.dart';
import '../screen/map_screen.dart';

class MapInitState extends States{
  final LocationMapState screenState;
  final List<PlacesResp> placesResp;
  final List<BuddiesResp> buddies;
  final LatLng  myLocation;
  MapInitState(this.screenState, {required this.placesResp ,required this.buddies ,required this.myLocation}):super()  {



      for (var element in placesResp)  {
        _markers.add(

            Marker(
              markerId: MarkerId(
                element.id.toString(),) ,
              position: LatLng(
          double.parse(element.latitude ??"0"),double.parse(element.longitude ??"0"),),
           icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
          infoWindow: InfoWindow(
              snippet:"Rating : ${element.rating}",
              title:element.name,onTap: (){
            Navigator.pushNamed(screenState.context, PlacesRoutes.Details,arguments: element.id.toString());
          }),
        ));
      }


    if(buddies.isNotEmpty){
      for (var element in buddies) {

        _markers.add(Marker(markerId: MarkerId(element.id.toString()) , position: LatLng(
          double.parse(element.latitude ??'0'),double.parse(element.longitude ??"0"),),
          icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
          infoWindow: InfoWindow(
              snippet:"Rating : ${element.rating}",
              title:element.name,onTap: (){
            Navigator.pushNamed(screenState.context, BuddiesRoutes.PROFBUDDIES,arguments: element.id.toString());
          }),
        ));
      }
    }


  }

  Set<Marker> _markers = {};


//  LatLng zahahLat = LatLng(33.8463,
//      35.9020); //initial currentPosition values cannot assign null values
  MapType _currentMapType = MapType.normal;


  void _onMapTypeButtonPressed() {

    _currentMapType = _currentMapType == MapType.normal
        ? MapType.satellite
        : MapType.normal;
    screenState.refresh();}

  @override
  Widget getUI(BuildContext context) {
   return Stack(
      children: <Widget>[
        GoogleMap(


          // onCameraMove: _onCameraMove,
          markers: _markers,
trafficEnabled: true,
          onTap: (poti) {

          },
          myLocationEnabled: true,
          mapType: _currentMapType,
          buildingsEnabled: true,
          indoorViewEnabled: true,
          tiltGesturesEnabled: true,
          rotateGesturesEnabled: true,

          compassEnabled: true,
          mapToolbarEnabled: true,
          myLocationButtonEnabled: false,
          padding: EdgeInsets.all(30),

          // onMapCreated: screenState.onMapCreated(controller),
          onCameraMove: (co){
//              customInfoWindowController.onCameraMove();
          },
          initialCameraPosition: CameraPosition(target: myLocation, zoom: 12.2),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(children: [
              FloatingActionButton(
                onPressed: () => _onMapTypeButtonPressed(),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: YellowColor,
                child: const Icon(Icons.map, size: 30.0),
              ),]),),),
      ],
    );
  }

}