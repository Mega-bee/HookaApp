import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/profile/model/item_option_model.dart';
import 'package:hooka/profile/request/delete_education_request.dart';
import 'package:hooka/profile/request/delete_experience_request.dart';
import 'package:hooka/profile/response/profile_response.dart';
import 'package:hooka/profile/ui/screens/edit_profile.dart';
import 'package:hooka/profile/ui/state/edit_profile/basic_info_edit.dart';
import 'package:hooka/profile/ui/state/edit_profile/education_edit.dart';
import 'package:hooka/profile/ui/state/edit_profile/experince_edit.dart';
import 'package:hooka/utils/style/colors.dart';
 import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'dart:io' as i;


class EditInitState extends States {
  final EditProfileState screenState;
  final ProfileResponse? module;

  EditInitState(this.screenState, this.module) : super(){
    profileImage = module?.imageUrl ?? '';
  }
  bool plus = false;
  bool plus2 = false;
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

      this._pickImage = imageTemporary;

      selectedImage = imageTemporary;
      screenState.refresh();
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  Widget BuildItem(String text, String subtext1, String subtext2) {
    num cont = 2;
    var controller = TextEditingController();
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "$text ${cont}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
              cursorColor: YellowColor,
              style: const TextStyle(fontSize: 18),
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "$subtext1",
                hintText: "$subtext1",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 0, color: Colors.black12)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
              cursorColor: YellowColor,
              style: const TextStyle(fontSize: 18),
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "$subtext2",
                hintText: "$subtext2",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 0, color: Colors.black12)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("from :",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border(
                  right: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  top: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  left: BorderSide(
                    color: Colors.black,
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
            Text("To :",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border(
                  right: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  top: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  left: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
              height: 30,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                onPressed: _presentDatePicker2,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () {
              EDUCTIONS.add(Education(university: controller.text));
            },
            child: Text('save'))
      ],
    );
  }

  String? profileImage;
  i.File? selectedImage;
  String location = 'Null, Press Button';
  String location2 = 'Null, Press Button';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Stack(children: [
            profileImage != null
                ?      Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl:profileImage!,
                height: 150,width: 150,
                fit: BoxFit.contain,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballBeat,
                    colors: [Colors.black],
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )
                : Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                    radius: 95,
                    backgroundColor: Colors.white,
                    child: Text(
                      "Edit Photo",
                      style: TextStyle(color: Primarycolor),
                    ),
                    backgroundImage: profileImage == null
                        ? null
                        : FileImage(_pickImage!)),
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
                            title: Text(
                              "Choose option",
                              style: TextStyle(color: YellowColor),
                            ),
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
                                          style: TextStyle(
                                            color: Colors.white,
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
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      screenState.refresh();
                                      _pickImage = null;
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
                                          style: TextStyle(
                                            color: Colors.white,
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

        Expanded(
          child: DefaultTabController(
            length: 4,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.0)
                    ),
                    child:  TabBar(
                      indicator: BoxDecoration(
                          color: YellowColor,
                          borderRadius:  BorderRadius.circular(12.0)
                      ) ,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      tabs: const  [
                        Tab(text: 'Personal info',),
                        Tab(text: 'Education',),
                        Tab(text: 'Experience',),
                        Tab(text: 'Address',)
                      ],
                    ),
                  ),
                    Expanded(
                      child: TabBarView(
                        children:  [
                          BasicInfoInitState(module,(request) => screenState.UpdateProfileee(request),),
                          EducationEditState(module?.education ?? [] , module?.genderId ,
                              addEducation: (request){
                            screenState.addEducation(request);

                              },removeEducation: (id){
                            screenState.deleteEducation(DeleteEducationRequest(EducationId: id));
                          }),
                          ExperinceEditState(module?.experience ?? []  ,
                              addExp: (request){
                            screenState.addExp(request);

                              },removeExp: (id){
                            screenState.deleteExperience(DeleteExperienceRequest(DeleteExperience: id));
                          }),


                          Center(child: Text('Settings Page'),)
                        ],
                      )
                  )
                ],
              ),
            )
          ),
        ),
      ],
    );
  }
}
