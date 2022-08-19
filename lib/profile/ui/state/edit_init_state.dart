
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooka/profile/response/profile_response.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as i;
import '../../../abstracts/states/state.dart';
import '../../../utils/components/picker.dart';
import '../../../utils/style/colors.dart';
import '../screens/edit_profile.dart';

class EditInitState extends States {

  final EditProfileState screenState;
  final ProfileResponse module;
  EditInitState(this.screenState,this.module);
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
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = i.File(image.path);
      screenState.refresh();

      this._pickImage = imageTemporary;

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
      ],
    );
  }
  @override
  Widget getUI(BuildContext context) {

    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is ProfileResponse) {
        module ==args;
      }
      flags = false;
    }
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    final email = TextEditingController(text: module.email??"");
    final name = TextEditingController(text: module.name??"");
    final Dob = TextEditingController(text: module.birthDate!.split("T").first);
    final Mobilenum = TextEditingController(text: module.phoneNumber??"");
    final Gender = TextEditingController(text: module.gender??"");
    final bio = TextEditingController(text: module.aboutMe??"");
    final fburl = TextEditingController(text: module.socialMediaLink1??"");
    final instaurl = TextEditingController(text: module.socialMediaLink2??"");
    final twitterurl = TextEditingController(text: module.socialMediaLink3??"");
    final university = TextEditingController(text: module.name??"");
    final degree = TextEditingController(text: module.name??"");
    final place = TextEditingController(text: module.name??"");
    final position = TextEditingController(text: module.name??"");

  return
    SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.90,
        width: MediaQuery.of(context).size.height * 0.70,
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
                children:[
                  SizedBox(height: mediaQueryHeight*0.02,),

                  Center(
                    child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: CircleAvatar(
                              radius: 66,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                  radius: 65,
                                  backgroundColor: Colors.white,
                                  child:
                                      module.imageUrl != null?

                                  Text("Edit Photo",style: TextStyle(color:Primarycolor),):
                                  Image.network(module.imageUrl.toString()),
                                  backgroundImage:

                                  module.imageUrl != null ? null : FileImage(_pickImage!)),
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

                                        horizontal: mediaQueryWidth * 0.05),
                                    child: CustomCupertinoPicker(

                                      label: "Gender",



                                      // events: address.regular.events,
                                      selectedValue: 0,
                                      inputType: TextInputType.text,
                                      controller:Gender, items: [
                                      "male",
                                      "female",
                                      "Rather not to say",

                                    ],
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
                                  ),])),
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
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("Education",style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),),


                              ),
                            ),
                            Spacer(),
                            TextButton(onPressed: (){
                              plus=true;
                              screenState.refresh();


                            }, child:Container(
                              height: 20,width: 20,
                                color: YellowColor,
                                child: Center(child: Text("+"))) ),
                            TextButton(onPressed: (){
                              plus=false;
                              screenState.refresh();


                            }, child:Container(
                                height: 20,width: 20,
                                color: YellowColor,
                                child: Center(child: Text("-"))) ),
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
                              controller:university,
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
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        plus==false?Container():BuildItem("Education","University","Degree"),
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
                        Spacer(),
                        TextButton(onPressed: (){
                          plus2=true;
                          screenState.refresh();


                        }, child:Container(
                            height: 20,width: 20,
                            color: YellowColor,
                            child: Center(child: Text("+"))) ),
                        TextButton(onPressed: (){
                          plus2=false;
                          screenState.refresh();


                        }, child:Container(
                            height: 20,width: 20,
                            color: YellowColor,
                            child: Center(child: Text("-"))) ),
                      ],
                    ),




                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        // ListView.builder(
                        // shrinkWrap: true,
                        // physics: ScrollPhysics(),
                        // itemCount: list.length,
                        // itemBuilder: (BuildContext context, int index) {
                        // _controllers.add(new TextEditingController());
                        // return Container(
                        // child: TextField(
                        // textAlign: TextAlign.start,
                        // controller:   _controllers[index],
                        // autofocus: false,
                        // keyboardType: TextInputType.text,),);}),
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
                        plus2==false?Container():BuildItem("Experience","Place","Position"),
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
          ),
        ),
      ),
    );
  }

}