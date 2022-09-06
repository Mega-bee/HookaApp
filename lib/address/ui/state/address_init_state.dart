
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooka/address/request/address_request.dart';
import 'package:hooka/auth/ui/widget/custem_button.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../response/address_response.dart';
import '../screen/Address_screen.dart';


class AddressInitState extends States{
  final List<AddressResponse> addressResponse;
  final AddresScreenState screenState;
  AddressInitState(this.addressResponse,this.screenState);

  bool value =false;
  bool value1 =false;
  bool DontHaveaddress =false;
  final _formKey1 = GlobalKey<FormState>();
  final title1 = TextEditingController();
  final building1 = TextEditingController();
  final appartment1 = TextEditingController();
  final city1= TextEditingController();
  final street1 = TextEditingController();
  String location = 'Press Button';
  String location2 = 'Press Button';
  String Address = 'search';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
  int? CheckBoxId;

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
    '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    screenState.refresh();

  }
  @override
  Widget getUI(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
   return SingleChildScrollView(
     child: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(28.0),
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [




               Text("Delivery Adress",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

               SizedBox(width: MediaQuery.of(context).size.width*0.1,),
               Padding(
                   padding: const EdgeInsets.all(8.0),
                   child:
                   DontHaveaddress==true? Container():
                   TextButton(
                     child: Text("New Address",style: TextStyle(decoration: TextDecoration.underline),),
                     onPressed: (){
                       DontHaveaddress=true;
                       screenState.refresh();
                     },
                   )
               ),


             ],),
         ),



         if(DontHaveaddress)

         Form(
           key: _formKey1,
           child: Column(
             children: [

               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Align(
                     alignment: Alignment.topLeft,
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Text(
                         "Address",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                     ),
                   ),
                   IconButton(onPressed: (){
                     DontHaveaddress=false;
                     title1.clear();
                     city1.clear();
                     street1.clear();
                     building1.clear();
                     appartment1.clear();

                   screenState.refresh();}, icon: Icon(Icons.close))
                 ],
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.01,
               ),
               Padding(
                 padding:
                 EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.05),
                 child: TextFormField(
                     cursorColor: YellowColor,
                     style: const TextStyle(fontSize: 18),
                     controller: title1,
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       labelText: "Title",
                       hintText: "Title",
                       enabledBorder: const OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           borderSide:
                           BorderSide(width: 0, color: Colors.black12)),
                       border: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                     ),
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     keyboardType: TextInputType.text),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.01,
               ),
               Padding(
                 padding:
                 EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.05),
                 child: TextFormField(
                     cursorColor: YellowColor,
                     style: const TextStyle(fontSize: 18),
                     controller: city1,
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       labelText: "City",
                       hintText: "City",
                       enabledBorder: const OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           borderSide:
                           BorderSide(width: 0, color: Colors.black12)),
                       border: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                     ),
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     keyboardType: TextInputType.text),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.01,
               ),
               Padding(
                 padding:
                 EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.05),
                 child: TextFormField(
                     cursorColor: YellowColor,
                     style: const TextStyle(fontSize: 18),
                     controller: street1,
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       labelText: "Street",
                       hintText: "Street",
                       enabledBorder: const OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           borderSide:
                           BorderSide(width: 0, color: Colors.black12)),
                       border: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                     ),
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     keyboardType: TextInputType.text),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.01,
               ),
               Padding(
                 padding:
                 EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.05),
                 child: TextFormField(
                     cursorColor: YellowColor,
                     style: const TextStyle(fontSize: 18),
                     controller: building1,
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       labelText: "Building",
                       hintText: "Building",
                       enabledBorder: const OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           borderSide:
                           BorderSide(width: 0, color: Colors.black12)),
                       border: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                     ),
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     keyboardType: TextInputType.text),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.01,
               ),
               Padding(
                 padding:
                 EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.05),
                 child: TextFormField(
                     cursorColor: YellowColor,
                     style: const TextStyle(fontSize: 18),
                     controller: appartment1,
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       labelText: "Appartment",
                       hintText: "Appartment",
                       enabledBorder: const OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           borderSide:
                           BorderSide(width: 0, color: Colors.black12)),
                       border: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                     ),
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     keyboardType: TextInputType.text),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.01,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text(
                     "latitude :${location}",
                   ),
                   Text("longitude :${location2}"),
                 ],
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.01,
               ),
               ElevatedButton(
                   onPressed: () async {
                     Position position = await _getGeoLocationPosition();
                     location = '${position.latitude}';
                     location2 = '${position.longitude}';

                     GetAddressFromLatLong(position);
                   },
                   child: Text('Get Location')),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.03,
               ),
             ],
           ),
         ),
         SizedBox(height: MediaQuery.of(context).size.height*0.03,),

         addressResponse.isNotEmpty?
         Padding(
           padding: const EdgeInsets.all(28.0),
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [




               Text("Your Addresses",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

               SizedBox(width: MediaQuery.of(context).size.width*0.1,),



             ],),
         ):Text("no Addresses"),
         addressResponse.isNotEmpty?
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: ListView.builder(
               physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               itemCount:addressResponse.length,
               itemBuilder: (context, index) {
                final mod=addressResponse[index];
                int? iddd=addressResponse[index].id;
                 return CheckboxListTile(

                   activeColor: YellowColor,
                   value: mod.isselected,
                   onChanged:(val) {
                     addressResponse.forEach((element) {
                       element.isselected = false;
                     });

                     addressResponse[index].isselected = true;
                   mod.isselected = val!;
                  CheckBoxId=mod.id;
                   print("hhhh ${mod.id} " );
                   screenState.refresh(

                   );
                   print("your idddd iss  ${CheckBoxId}");


                },
                 title:Text( mod.title.toString(),),
                   subtitle: Text( mod.city.toString(),),


                 );



               }),
         ):Text("no Adresses"),

         SizedBox(height: MediaQuery.of(context).size.height*0.03,),
         Container(width: 250,height: 50,
           child: CustomButton(bgColor: YellowColor, text: "Confirm Order", textColor: Colors.black,
               loading:  screenState.loadingSnapshot.connectionState ==
                   ConnectionState.waiting,
               buttonTab: (){

             DontHaveaddress==true?
             screenState.Makeorder(OrderRequest(addressId: 0,Title: title1.text,Street: street1.text,Longitude: location2.toString(),Latitude: location.toString(),
                 City: city1.text,Building: building1.text,Appartment: appartment1.text
             )

             ):  screenState.Makeorder(OrderRequest(addressId:CheckBoxId,Appartment: "empty",Building: "empty",City: "empty",
             Latitude: "",Longitude: "",Street: "empty",Title: "empty",
             ));
             print(OrderRequest);

               }),
         ),
         SizedBox(height: MediaQuery.of(context).size.height*0.1,),
       ],
     ),
   );
  }





}
