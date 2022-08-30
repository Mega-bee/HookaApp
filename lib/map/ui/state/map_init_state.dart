import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../abstracts/states/state.dart';
import '../../../hooka_places/response/places_response.dart';
import '../../../utils/style/colors.dart';
import '../screen/map_screen.dart';

class MapInitState extends States{
  final LocationMapState screenState;
  final List<PlacesResp> placesResp;
  MapInitState(this.screenState,this.placesResp):super(){
    placesResp.forEach((element) {
      _markers.add(Marker(markerId: MarkerId(element.id.toString()) , position: LatLng(
          double.parse(element.latitude ??""),double.parse(element.longitude ??""),),
      infoWindow: InfoWindow(title:element.name,),
      ));
    });
  }
 
  Set<Marker> _markers = {};
 
  LatLng? _addresPotion;
  LatLng zahahLat = LatLng(33.8463,
      35.9020); //initial currentPosition values cannot assign null values

  // static const LatLng _center = const LatLng(45.521563, -122.677433);
  // Location currentLocation = Location();

  @override
  // void initState() {
  //   // TODO: implement initState
  //  
  //
  //   defaultLocation().then((value) {
  //     _markers = value!;
  //     if(screenState.mounted){
  //      screenState.refresh();
  //     }
  //   });
  //
  //   // super.initState();
  // }
  



 // void markesplaces (){
 //    ListView.builder(
 //        itemCount: placesResp.length,
 //       itemBuilder: (context1, index) {
 //      final mod = placesResp[index];
 //   //    return Markersss(
 //   //
 //   //
 //   //
 //   // );
 // });}
 
  MapType _currentMapType = MapType.normal;

  // LatLng _lastMapPosition = _center;

  // void _onCameraMove(CameraPosition position) {
  //   _lastMapPosition = position.target;
  // }

  void _onMapTypeButtonPressed() {

    _currentMapType = _currentMapType == MapType.normal
        ? MapType.satellite
        : MapType.normal;
    screenState.refresh();}
  //   setState(() {
  //     _currentMapType = _currentMapType == MapType.normal
  //         ? MapType.satellite
  //         : MapType.normal;
  //   });
  // }
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  LatLng _lastMapPosition = _center;
  void _onAddMarkerButtonPressed() {
    // setState(() {

      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    screenState.refresh();
    // }

  }


  bool loading = false;

  Future<Set<Marker>?> defaultLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    var myLocation = await Location.instance.getLocation();
    LatLng myPos = LatLng(myLocation.latitude ?? 0, myLocation.longitude ?? 0);
    if (myPos != null) {
      _addresPotion = myPos;
    } else {
      _addresPotion = zahahLat;
    }
    customInfoWindowController!.googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: myPos, zoom: 15)));

    return   {
      Marker(
        markerId: MarkerId('Default'),
        position: _addresPotion!,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      )
    };
  }


  // void _onAddMarkerButtonPressed() {
  //   setState(() {
  //     _markers.add(Marker(
  //       // This marker id can be anything that uniquely identifies each marker.
  //       markerId: MarkerId(myPos.toString()),
  //       position: myPos,
  //       infoWindow: InfoWindow(
  //         title: 'Really cool place',
  //         snippet: '5 Star Rating',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ));
  //   });
  // }
  @override
  Widget getUI(BuildContext context) {
   return Stack(
      children: <Widget>[
        GoogleMap(
          // onCameraMove: _onCameraMove,
          markers: _markers,
          onTap: (poti) {
            _markers.clear();
            _markers.add(

                Marker(

                  markerId: MarkerId('selected'),
                  position: poti,

                  icon: BitmapDescriptor.defaultMarker,
                ));
            _addresPotion = poti;
         screenState.refresh();
          },
          myLocationEnabled: true,
          mapType: _currentMapType,
          buildingsEnabled: true,
          compassEnabled: true,
          mapToolbarEnabled: true,
          myLocationButtonEnabled: false,
          onMapCreated: screenState.onMapCreated(controller),
          onCameraMove: (co){
//              customInfoWindowController.onCameraMove();
          },
          initialCameraPosition: CameraPosition(target: zahahLat, zoom: 10.2),
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
        Padding(
          padding: const EdgeInsets.all(56.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child:
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [




                InkWell(
                  onTap: () => _onAddMarkerButtonPressed,
                  child: Container(
                    width:120,
                    height: 60,

                    child:  Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      color: YellowColor,
                      child: Column(

                        children: [
                          const Icon(Icons.restaurant, size: 30.0),
                          Text("Hooka Places")
                        ],
                      ),
                    ),

                  ),
                ),
                SizedBox(
                  width: 52,
                ),
                InkWell(
                  onTap: () => _onAddMarkerButtonPressed,
                  child: Container(
                    width:120,
                    height: 60,

                    child:  Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      color: YellowColor,
                      child: Column(

                        children: [
                          const Icon(Icons.person, size: 30.0),
                          Text("Hooka buddies")
                        ],
                      ),
                    ),

                  ),
                ),
                SizedBox(
                  width: 12,
                ),

                // FloatingActionButton(
                //   onPressed: null,
                //   materialTapTargetSize: MaterialTapTargetSize.padded,
                //   backgroundColor: redColor,
                //   child: const Icon(Icons.add_location, size: 30.0),
                // ),
                // SizedBox(
                //   height: 12,
                // ),
//                FloatingActionButton(
//                    backgroundColor: redColor,
//                    onPressed: () async {
//                       defaultLocation();
//                    },
//                    child: const Icon(
//                      Icons.location_searching,
//                      size: 30.0,
//                    )),

                //         FloatingActionButton(
                // child: Icon(Icons.location_searching,color: Colors.white,),
                // onPressed: (){
                //
                // },)
              ]),
            ),
          ),
        ),

        // Align(
        //     alignment: Alignment.center,
        //     // child: !loadingconf?
        // InkWell(
        //
        //     onTap: () async {
        //       setState(() {
        //         loadingconf==true;
        //       });
        //       await getCurrentLocation();
        //       setState(() {
        //         loadingconf==false;
        //       });
        //     },
        // child: Icon(
        //   Icons.dot,
        //   size: 20,
        //   color: redColor,
        // ))
      ],
    );
  }

}