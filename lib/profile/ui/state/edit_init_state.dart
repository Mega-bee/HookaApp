
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooka/profile/request/add_experience_request.dart';
import 'package:hooka/profile/response/profile_response.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as i;
import '../../../abstracts/states/state.dart';
import '../../../auth/ui/widget/custem_button.dart';
import '../../../utils/components/picker.dart';
import '../../../utils/style/colors.dart';
import '../../request/add_education_request.dart';
import '../screens/edit_profile.dart';

class EditInitState extends States {

  final EditProfileState screenState;
  final ProfileResponse? module;
  EditInitState(this.screenState,this.module) : super (){
    if(module != null)  {
      email.text = module?.email ??'';
      name.text = module?.name ??'';
      Mobilenum.text = module?.phoneNumber ??'';
      Dob.text = module?.birthDate?.split("T").first ??'';
      fburl.text = module?.socialMediaLink1 ??'';
      instaurl.text = module?.socialMediaLink2 ??'';
      twitterurl.text = module?.socialMediaLink3 ??'';
      Gender.text=module?.gender ??"";
      hobbies.text=module?.hobbies ??"";
      weight.text=module?.weight.toString() ??"" ;
      height.text=module?.height.toString()  ??"";
      Eyes.text=module?.eyes ??"";
      Hair.text=module?.hair ??"";
      interest.text=module?.profession ??"";
      profession.text=module?.interests ??"";
      bodytype.text=module?.bodyType ??"";
      materialstatus.text=module?.maritalStatus ??"";
      profileImage = module?.imageUrl ?? '' ;
      EDUCTIONS = module?.education ?? [];}
  }
  bool plus=false;
  bool plus2=false;
  bool flags = true;
  var _selectedDateTO;
  var _selectedDate1;
  var _selectedDate2;
  var _selectedDate3;
  var _selectedDate4;
  i.File? _pickImage;
  final _formKey = GlobalKey<FormState>();
  void _presentDatePickerTO() {
    showDatePicker(

      context: screenState.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      _selectedDateTO = pickedDate;
      screenState.refresh();

    });

    print('...');
  }
  void _presentDatePicker1() {
    showDatePicker(

      context: screenState.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      screenState.refresh();

      _selectedDate1 = pickedDate;

    });

    print('...');
  }
  void _presentDatePicker2() {
    showDatePicker(

      context: screenState.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      screenState.refresh();

      _selectedDate2 = pickedDate;

    });

    print('...');
  }
  void _presentDatePicker3() {
    showDatePicker(

      context: screenState.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      screenState.refresh();

      _selectedDate3 = pickedDate;

    });

    print('...');
  }
  void _presentDatePicker4() {
    showDatePicker(

      context: screenState.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      screenState.refresh();

      _selectedDate4 = pickedDate;

    });

    print('...');
  }
  List<Education> EDUCTIONS = [];
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = i.File(image.path);

this._pickImage=imageTemporary;

      selectedImage = imageTemporary;
      screenState.refresh();
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }
  Widget BuildItem(String text,String subtext1,String subtext2){
    num cont=2;
    var controller =TextEditingController();
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
            padding: const EdgeInsets.all(20.0),
        child: Text("$text ${cont}",style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.w600,
        ),),)),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20),
          child: TextFormField(
              cursorColor: YellowColor,
              style: const TextStyle(fontSize: 18),
              controller:controller,
              decoration: InputDecoration(

                filled: true,
                fillColor: Colors.white,
                labelText:"$subtext1",
                hintText: "$subtext1",

                enabledBorder: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        width: 0, color: Colors.black12)),
                border: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),

              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text),
        ),

        SizedBox(
          height: 10,
        ),

        Padding(
          padding: EdgeInsets.symmetric(
              horizontal:20),
          child: TextFormField(
              cursorColor: YellowColor,
              style: const TextStyle(fontSize: 18),
              controller:controller,
              decoration: InputDecoration(

                filled: true,
                fillColor: Colors.white,
                labelText:"$subtext2",
                hintText: "$subtext2",

                enabledBorder: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        width: 0, color: Colors.black12)),
                border: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),

              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text),
        ),
        SizedBox(
          height: 10,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("from :",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
            Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),

                border: Border(
                  right:  BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  bottom:  BorderSide(
                    color:Colors.black,
                    width: 1,
                  ),
                  top:  BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  left: BorderSide(
                    color:Colors.black,
                    width: 1,
                  ),
                ),
              ),
              height: 30,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: _selectedDate1 == null
                    ? Text(
                  "From",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
                    : Text(
                  _selectedDate1.toString().split(' ').first,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _presentDatePicker1,
              ),
            ),
            Text("To :",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),

                border: Border(
                  right:  BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  bottom:  BorderSide(
                    color:Colors.black,
                    width: 1,
                  ),
                  top:  BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  left: BorderSide(
                    color:Colors.black,
                    width: 1,
                  ),
                ),
              ),

              height: 30,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary:Colors.black,
                ),
                child: _selectedDate2 == null
                    ? Text(
                  "To",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
                    : Text(
                  _selectedDate2.toString().split(' ').first,
                  style: TextStyle(
                    fontSize: 12,
                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _presentDatePicker2,
              ),
            ),
          ],),
        SizedBox(
          height:10,
        ),
        TextButton(
            onPressed:(){

          EDUCTIONS.add( Education(university: controller.text));
        }, child: Text('save'))
      ],
    );
  }
  final email = TextEditingController();
  final name = TextEditingController();
  final Dob = TextEditingController();
  final title = TextEditingController();
  final building = TextEditingController();
  final appartment = TextEditingController();
  final city = TextEditingController();
  final street = TextEditingController();
  final Mobilenum = TextEditingController();
  final Gender = TextEditingController();
  final Eyes = TextEditingController();
  final Hair = TextEditingController();
  final bio = TextEditingController();
  final weight = TextEditingController();
  final height = TextEditingController();
  final materialstatus = TextEditingController();
  final bodytype = TextEditingController();
  final profession = TextEditingController();
  final interest = TextEditingController();
  final fburl = TextEditingController();
  final instaurl = TextEditingController();
  final twitterurl = TextEditingController();
  final university = TextEditingController();
  final degree = TextEditingController();
  final hobbies = TextEditingController();
  final place = TextEditingController();
  final position = TextEditingController();
  String? profileImage;
  i.File? selectedImage;
  String location ='Null, Press Button';
  String location2 ='Null, Press Button';
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
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    screenState.refresh();
  }



  String validatePass(value) {
    if (value.isEmpty) {
      return 'Required *';
    }
    return "";
  }
  @override
  Widget getUI(BuildContext context) {


    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;



  return
    SingleChildScrollView(
      child: Column(
          children:[
            SizedBox(height: mediaQueryHeight*0.02,),

            Center(
              child: Stack(
                  children: [
                    profileImage != null?
                    Image.network(profileImage!,height: 170,width: 170,):
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                            radius: 95,
                            backgroundColor: Colors.white,
                            child:


                            Text("Edit Photo",style: TextStyle(color:Primarycolor),)
                           ,
                            backgroundImage:

                            profileImage == null ? null : FileImage(_pickImage!)),
                      ),
                    ),
                    Positioned(
                        top: 110,
                        left: 95,
                        child: RawMaterialButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.black,
                                    title: Text("Choose option",style: TextStyle(color: YellowColor),),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              pickImage(ImageSource.camera);
                                              screenState.refresh();
                                            },
                                            splashColor: YellowColor,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.camera_alt_outlined,
                                                    color: YellowColor,
                                                  ),
                                                ),
                                                Text(
                                                  "Camera",
                                                  style: TextStyle(color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              pickImage(ImageSource.gallery);
                                              screenState.refresh();

                                            },
                                            splashColor: YellowColor,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.image,
                                                    color: YellowColor,
                                                  ),
                                                ),
                                                Text(
                                                  "Gallery",
                                                  style: TextStyle(color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                       screenState.refresh();
                                                _pickImage  = null;


                                            },
                                            splashColor: YellowColor,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                Text(
                                                  "Delete",
                                                  style: TextStyle(color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          elevation: 10,
                          fillColor: Primarycolor,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: YellowColor,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ))
                  ]),
            ),
            SizedBox(height: mediaQueryHeight*0.02,),
            Card(
              color: Colors.white,

              child: Column(
                children: [Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Personal Info",style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),),


                  ),
                ),




                  SizedBox(height: mediaQueryHeight*0.05,),
                  Form(
                      key: _formKey,
                      child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child:
                              TextFormField(
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 18),
                                  controller:name,
                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText:"Name",
                                    hintText: " Name",
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),

                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.emailAddress),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 18),
                                  controller:email,
                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText:"Email",
                                    hintText: " Email",

                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),

                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.emailAddress),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 18),
                                  controller:Mobilenum,
                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText:"Mobile",
                                    hintText: " Mobile",
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  validator: MultiValidator([

                                    EmailValidator(errorText: 'Not a valid number'),
                                  ]),
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.phone),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                  onTap:_presentDatePickerTO ,
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 18),
                                  controller:Dob,


                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText:"date of birth",
                                    hintText: " Date of birth",
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),

                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.phone),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(

                                  horizontal: mediaQueryWidth * 0.05,),
                              child: Container(
                                height: 60,width: 400,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
    color: Colors.black12,
    style: BorderStyle.solid,
    width: 1.0,),),
                                child: CustomCupertinoPicker(

                                  label: "Hair",



                                  // events: address.regular.events,
                                  selectedValue: 0,
                                  inputType: TextInputType.text,
                                  controller:Hair,
                                  items: [
                                    "Brown",
                                    "Black",
                                    "Red",


                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(

                                horizontal: mediaQueryWidth * 0.05,),
                              child: Container(
                                height: 60,width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black12,
                                    style: BorderStyle.solid,
                                    width: 1.0,),),
                                child: CustomCupertinoPicker(

                                  label: "Material Status",



                                  // events: address.regular.events,
                                  selectedValue: 0,
                                  inputType: TextInputType.text,
                                  controller:materialstatus,
                                  items: [
                                    "Maried",
                                    "Single",
                                    "Eather Not To Say",
                                    "Engaged",


                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(

                                horizontal: mediaQueryWidth * 0.05,),
                              child: Container(
                                height: 60,width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black12,
                                    style: BorderStyle.solid,
                                    width: 1.0,),),
                                child: CustomCupertinoPicker(

                                  label: "Body Type",



                                  // events: address.regular.events,
                                  selectedValue: 0,
                                  inputType: TextInputType.text,
                                  controller:bodytype,
                                  items: [
                                    "Ectomorph",
                                    "Mesomorph",
                                    "Endomorph",


                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(

                                  horizontal: mediaQueryWidth * 0.05),
                              child: Container(

                                height: 60,width: 400,
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black12,
                                    style: BorderStyle.solid,
                                    width: 1.0,),),
                                child: CustomCupertinoPicker(


                                  label: "Eyes",



                                  // events: address.regular.events,
                                  selectedValue: 0,
                                  inputType: TextInputType.text,
                                  controller:Eyes,
                                  items: [
                                    "Blue",
                                    "Green",
                                    "Brown",
                                    "Black",


                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(

                                  horizontal: mediaQueryWidth * 0.05),
                              child: Container(
                                height: 60,width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black12,
                                    style: BorderStyle.solid,
                                    width: 1.0,),),
                                child: CustomCupertinoPicker(

                                  label: "Gender",



                                  // events: address.regular.events,
                                  selectedValue: 0,
                                  inputType: TextInputType.text,
                                  controller:Gender,
                                  items: [
                                  "Male",
                                  "Female",


                                ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 18),
                                  controller:bio,
                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText:"Bio",
                                    hintText: " Bio",

                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),

                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 18),
                                  controller:weight,
                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText:"Weight (kg)",
                                    hintText: "Weight (kg)",

                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),

                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 18),
                                  controller:height,

                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText:"Height (cm)",
                                    hintText: "Height (cm)",

                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),

                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 18),
                                  controller:interest,

                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText:"Interest",
                                    hintText: "Interest",

                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),

                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 18),
                                  controller:profession,

                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText:"Profession",
                                    hintText: "Profession",

                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),

                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 18),
                                  controller:hobbies,
                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText:"Hobbies",
                                    hintText: "Hobbies",

                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),

                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text),
                            ),
                          ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Social Media",style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),


                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:fburl,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"Facebook Url",
                          hintText: " Facebook Url",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:instaurl,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"Instagram Url",
                          hintText: " Instagram Url",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:twitterurl,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"Twitter Url",
                          hintText: " Twitter Url",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Education",style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),


                    ),
                  ),


                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:university,
                       validator: validatePass,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"University",
                          hintText: " University",


                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:degree,
                        validator: validatePass,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"Degree",
                          hintText: " Degree",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("from :",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),

                          border: Border(
                            right:  BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            bottom:  BorderSide(
                              color:Colors.black,
                              width: 1,
                            ),
                            top:  BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            left: BorderSide(
                              color:Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.034,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: _selectedDate1 == null
                              ? Text(
                            "From",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                              : Text(
                            _selectedDate1.toString().split(' ').first,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _presentDatePicker1,
                        ),
                      ),
                      Text("To :",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),

                          border: Border(
                            right:  BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            bottom:  BorderSide(
                              color:Colors.black,
                              width: 1,
                            ),
                            top:  BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            left: BorderSide(
                              color:Colors.black,
                              width: 1,
                            ),
                          ),
                        ),

                        height: MediaQuery.of(context).size.height * 0.034,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: _selectedDate2 == null
                              ? Text(
                            "To",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                              : Text(
                            _selectedDate2.toString().split(' ').first,
                            style: TextStyle(
                              fontSize: 12,
                              color:Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _presentDatePicker2,
                        ),
                      ),
                    ],),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    width: 200,
                    child: CustomButton(
                      buttonTab: () {
                        if(_formKey.currentState!.validate() || _selectedDate1!=null){
                          screenState.AddEdd(AddEducationRequest(
                            id: 0,
                            Degree: degree.text,
                            University: university.text,
                            StudiedTo: _selectedDate2.toString().split(' ').first,
                            StudiedFrom:_selectedDate1.toString().split(' ').first,
                            IsDeleted: false,

                          ));

                        }
                      },
                      loading: screenState.loadingSnapshot.connectionState ==
                          ConnectionState.waiting,
                      text: 'Add Education',
                      bgColor: YellowColor,
                      textColor: Colors.black,

                    ),
                  ),
                  Container(

                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: module!.education!.length,
                      itemBuilder: (context1, index) {
                        final mod = module!.education![index];
                        return
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(

                              height: 380,width:double.infinity,
                              child: Card(
                              shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),),
                                child: Column(
                                  children: [

                                    Container(
                                      color:YellowColor,width: 500,
                                      height: 120,
                                      child:
                                      module!.genderId==1?
                                      Image.asset("assets/images/istockphoto-910022842-170667a-removebg-preview.png",
                                        fit: BoxFit.contain,
                                        height: 20,width: 20,):Image.asset("assets/images/fuser-Graduate-512.webp",
                                        fit: BoxFit.contain,
                                        height: 20,width: 20,),
                                    ),
                                    SizedBox(height: 20,),
                                   Container(
                                     color: Colors.grey[200],
                                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                                       Text("University      :",style: TextStyle(fontSize: 20),),
                                       Text(mod.university.toString(),style: TextStyle(fontSize: 20),)
                                     ],),
                                   ),
                                    SizedBox(height: 15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Degree          :",style: TextStyle(fontSize: 20),),
                                          Text(mod.degree.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),SizedBox(height:15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("    From              :",style: TextStyle(fontSize: 20),),
                                          Text(mod.studiedFrom.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),SizedBox(height: 15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text( "    To                   :",style: TextStyle(fontSize: 20),),
                                          Text(mod.studiedTo.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),

                                    SizedBox(height: 45,),
                                    Container(
                                      height: 35,width: 180,


                                      child: Card(color: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(color: Colors.black, width: 1),),
                                          child: Center(child: Text("Remove",style: TextStyle(color: YellowColor,fontWeight: FontWeight.bold),))),),



                                  ],
                                ),
                              ),
                            ),
                          );
                      },
                      shrinkWrap: true,

                    ),
                  ),

              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Experience",style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),


                    ),
                  ),

                ],
              ),




                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:place,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"Place",
                          hintText: " Place",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:position,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"Position",
                          hintText: " Position",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("from :",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),

                          border: Border(
                            right:  BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            bottom:  BorderSide(
                              color:Colors.black,
                              width: 1,
                            ),
                            top:  BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            left: BorderSide(
                              color:Colors.black,
                              width: 1,
                            ),
                          ),
                        ),

                        height: MediaQuery.of(context).size.height * 0.034,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: _selectedDate3 == null
                              ? Text(
                            "From",
                            style: TextStyle(
                              fontSize: 12,
                              color:  Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                              : Text(
                            _selectedDate3.toString().split(' ').first,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _presentDatePicker3,
                        ),
                      ),
                      Text("To :",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),

                          border: Border(
                            right:  BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            bottom:  BorderSide(
                              color:Colors.black,
                              width: 1,
                            ),
                            top:  BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            left: BorderSide(
                              color:Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.034,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: _selectedDate4 == null
                              ? Text(
                            "To",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                              : Text(
                            _selectedDate4.toString().split(' ').first,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _presentDatePicker4,
                        ),
                      ),
                    ],),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    width: 200,
                    child: CustomButton(
                      buttonTab: () {
                        if(_formKey.currentState!.validate() || _selectedDate3!=null
                        || place.text.isNotEmpty || place.text.isNotEmpty
                        ){
                          screenState.AddExp(AddExperienceRequest(
                            id: 0,
                           Place: place.text,
                            Position:position.text ,
                            WorkedFrom:_selectedDate3 ,
                            WorkedTo: _selectedDate4,
                            IsDeleted: false,

                          ));

                        }
                      },
                      loading: screenState.loadingSnapshot.connectionState ==
                          ConnectionState.waiting,
                      text: 'Add Experience',
                      bgColor: YellowColor,
                      textColor: Colors.black,

                    ),
                  ),
                  Container(

                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: module!.experience!.length,
                      itemBuilder: (context1, index) {
                        final mod = module!.experience![index];
                        return
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(

                              height: 380,width:double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black, width: 1),),
                                child: Column(
                                  children: [

                                    Container(
                                      color:YellowColor,width: 500,
                                      height: 120,
                                      child:
                                      Icon(Icons.work,size: 90,),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Place           :",style: TextStyle(fontSize: 20),),
                                          Text(mod.place.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),
                                    SizedBox(height: 15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Position        :",style: TextStyle(fontSize: 20),),
                                          Text(mod.position.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),SizedBox(height:15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(" From             :",style: TextStyle(fontSize: 20),),
                                          Text(mod.workedFrom.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),SizedBox(height: 15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text( " To                 :",style: TextStyle(fontSize: 20),),
                                          Text(mod.workedTo.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),

                                    SizedBox(height: 45,),
                                    Container(
                                      height: 35,width: 180,


                                      child: Card(color: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(color: Colors.black, width: 1),),
                                          child: Center(child: Text("Remove",style: TextStyle(color: YellowColor,fontWeight: FontWeight.bold),))),),



                                  ],
                                ),
                              ),
                            ),
                          );
                      },
                      shrinkWrap: true,

                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("Address",style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),),


                        ),
                      ),

                    ],
                  ),




                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:title,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"Title",
                          hintText: "Title",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:city,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"City",
                          hintText: "City",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:street,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"Street",
                          hintText: "Street",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:building,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"Building",
                          hintText: "Building",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 18),
                        controller:appartment,
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          labelText:"Appartment",
                          hintText: "Appartment",

                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("${location}",),
                        Text("${location2}"
                         ),

                    ],

                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  ElevatedButton(onPressed: () async{
                    Position position = await _getGeoLocationPosition();
                    location ='Lat: ${position.latitude}';
                    location2 =' Long: ${position.longitude}';
                    GetAddressFromLatLong(position);
                  }, child: Text('Get Location')),


                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    width: 200,
                    child: CustomButton(
                      buttonTab: () {
                        if(_formKey.currentState!.validate() || _selectedDate3!=null
                            || place.text.isNotEmpty || place.text.isNotEmpty
                        ){
                          screenState.AddExp(AddExperienceRequest(
                            id: 0,
                            Place: place.text,
                            Position:position.text ,
                            WorkedFrom:_selectedDate3 ,
                            WorkedTo: _selectedDate4,
                            IsDeleted: false,

                          ));

                        }
                      },
                      loading: screenState.loadingSnapshot.connectionState ==
                          ConnectionState.waiting,
                      text: 'Add Address',
                      bgColor: YellowColor,
                      textColor: Colors.black,

                    ),
                  ),
                  Container(

                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: module!.addresses!.length,
                      itemBuilder: (context1, index) {
                        final mod = module!.addresses![index];
                        return
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(

                              height: 480,width:double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black, width: 1),),
                                child: Column(
                                  children: [

                                    Container(
                                      color:YellowColor,width: 500,
                                      height: 120,
                                      child:
                                      Icon(Icons.location_city,size: 90,),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Title               :",style: TextStyle(fontSize: 20),),
                                          Text(mod.title.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),
                                    SizedBox(height: 15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("City                  :",style: TextStyle(fontSize: 20),),
                                          Text(mod.city.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),SizedBox(height:15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(" Building             :",style: TextStyle(fontSize: 20),),
                                          Text(mod.building.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),SizedBox(height: 15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text( " Appartment            :",style: TextStyle(fontSize: 20),),
                                          Text(mod.appartment.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),SizedBox(height: 15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text( " Longitude            :",style: TextStyle(fontSize: 20),),
                                          Text(mod.longitude.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),SizedBox(height: 15,),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text( " Latitude            :",style: TextStyle(fontSize: 20),),
                                          Text(mod.latitude.toString(),style: TextStyle(fontSize: 20),)
                                        ],),
                                    ),

                                    SizedBox(height: 45,),
                                    Container(
                                      height: 35,width: 180,


                                      child: Card(color: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(color: Colors.black, width: 1),),
                                          child: Center(child: Text("Remove",style: TextStyle(color: YellowColor,fontWeight: FontWeight.bold),))),),



                                  ],
                                ),
                              ),
                            ),
                          );
                      },
                      shrinkWrap: true,

                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  ElevatedButton(
                    onPressed: () {

                      // Fluttertoast.showToast(
                      //     msg: getTranslate(context, 'fillField'),
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.BOTTOM,
                      //     timeInSecForIosWeb: 1);

                    },
//                             } Navigator.of(context).pushReplacement(MaterialPageRoute(
//                                  builder: (context) =>  Navigationbar()));

                    child:  Text(
                      'SAVE',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto-Bold'),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: mediaQueryWidth * 0.23,
                          vertical: mediaQueryHeight * 0.018),
                      primary: YellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),








                ],
              ),
            ),
          ]),
    );
  }

}