import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooka/auth/ui/widget/custem_button.dart';
import 'package:hooka/profile/model/item_option_model.dart';
import 'package:hooka/profile/request/update_profile_request.dart';
import 'package:hooka/profile/response/profile_response.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as i;
import '../../../../utils/style/colors.dart';


class BasicInfoInitState extends StatefulWidget {
  final ProfileResponse? module;
  final Function(UpdateProfileRequest) updateBasicInfo;
  BasicInfoInitState(this.module, this.updateBasicInfo);

  @override
  State<BasicInfoInitState> createState() => BasicInfoInitScreenState();
}

class BasicInfoInitScreenState extends State<BasicInfoInitState> {
  i.File? _pickImage;
  final _formKey = GlobalKey<FormState>();
//  Future pickImage(ImageSource source) async {
//    try {
//      final image = await ImagePicker().pickImage(source: source);
//      if (image == null) return;
//      final imageTemporary = i.File(image.path);
//
//      this._pickImage = imageTemporary;
//
//      selectedImage = imageTemporary;
//    } on PlatformException catch (e) {
//      print("Failed to pick image $e");
//    }
//  }

//  Widget BuildItem(String text, String subtext1, String subtext2) {
//    num cont = 2;
//    var controller = TextEditingController();
//    return Column(
//      children: [
//        Align(
//            alignment: Alignment.topLeft,
//            child: Padding(
//              padding: const EdgeInsets.all(20.0),
//              child: Text(
//                "$text ${cont}",
//                style: TextStyle(
//                  fontSize: 20,
//                  fontWeight: FontWeight.w600,
//                ),
//              ),
//            )),
//        Padding(
//          padding: EdgeInsets.symmetric(horizontal: 20),
//          child: TextFormField(
//              cursorColor: YellowColor,
//              style: const TextStyle(fontSize: 18),
//              controller: controller,
//              decoration: InputDecoration(
//                filled: true,
//                fillColor: Colors.white,
//                labelText: "$subtext1",
//                hintText: "$subtext1",
//                enabledBorder: const OutlineInputBorder(
//                    borderRadius: BorderRadius.all(Radius.circular(10)),
//                    borderSide: BorderSide(width: 0, color: Colors.black12)),
//                border: OutlineInputBorder(
//                  borderSide: const BorderSide(color: Colors.grey),
//                  borderRadius: BorderRadius.circular(10.0),
//                ),
//              ),
//              autovalidateMode: AutovalidateMode.onUserInteraction,
//              keyboardType: TextInputType.text),
//        ),
//        SizedBox(
//          height: 10,
//        ),
//        Padding(
//          padding: EdgeInsets.symmetric(horizontal: 20),
//          child: TextFormField(
//              cursorColor: YellowColor,
//              style: const TextStyle(fontSize: 18),
//              controller: controller,
//              decoration: InputDecoration(
//                filled: true,
//                fillColor: Colors.white,
//                labelText: "$subtext2",
//                hintText: "$subtext2",
//                enabledBorder: const OutlineInputBorder(
//                    borderRadius: BorderRadius.all(Radius.circular(10)),
//                    borderSide: BorderSide(width: 0, color: Colors.black12)),
//                border: OutlineInputBorder(
//                  borderSide: const BorderSide(color: Colors.grey),
//                  borderRadius: BorderRadius.circular(10.0),
//                ),
//              ),
//              autovalidateMode: AutovalidateMode.onUserInteraction,
//              keyboardType: TextInputType.text),
//        ),
//        SizedBox(
//          height: 10,
//        ),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: [
//            Text("from :",
//                style: TextStyle(
//                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
//            Container(
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(5),
//                border: Border(
//                  right: BorderSide(
//                    color: Colors.black,
//                    width: 1,
//                  ),
//                  bottom: BorderSide(
//                    color: Colors.black,
//                    width: 1,
//                  ),
//                  top: BorderSide(
//                    color: Colors.black,
//                    width: 1,
//                  ),
//                  left: BorderSide(
//                    color: Colors.black,
//                    width: 1,
//                  ),
//                ),
//              ),
//              height: 30,
//              child: TextButton(
//                style: TextButton.styleFrom(
//                  primary: Colors.black,
//                ),
//                child: _selectedDate1 == null
//                    ? Text(
//                  "From",
//                  style: TextStyle(
//                    fontSize: 12,
//                    color: Colors.black,
//                    fontWeight: FontWeight.bold,
//                  ),
//                )
//                    : Text(
//                  _selectedDate1.toString().split(' ').first,
//                  style: TextStyle(
//                    fontSize: 12,
//                    color: Colors.black,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//                onPressed: _presentDatePicker1,
//              ),
//            ),
//            Text("To :",
//                style: TextStyle(
//                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
//            Container(
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(5),
//                border: Border(
//                  right: BorderSide(
//                    color: Colors.black,
//                    width: 1,
//                  ),
//                  bottom: BorderSide(
//                    color: Colors.black,
//                    width: 1,
//                  ),
//                  top: BorderSide(
//                    color: Colors.black,
//                    width: 1,
//                  ),
//                  left: BorderSide(
//                    color: Colors.black,
//                    width: 1,
//                  ),
//                ),
//              ),
//              height: 30,
//              child: TextButton(
//                style: TextButton.styleFrom(
//                  primary: Colors.black,
//                ),
//                child: _selectedDate2 == null
//                    ? Text(
//                  "To",
//                  style: TextStyle(
//                    fontSize: 12,
//                    color: Colors.black,
//                    fontWeight: FontWeight.bold,
//                  ),
//                )
//                    : Text(
//                  _selectedDate2.toString().split(' ').first,
//                  style: TextStyle(
//                    fontSize: 12,
//                    color: Colors.black,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//                onPressed: _presentDatePicker2,
//              ),
//            ),
//          ],
//        ),
//        SizedBox(
//          height: 10,
//        ),
//        TextButton(
//            onPressed: () {
//              EDUCTIONS.add(Education(university: controller.text));
//            },
//            child: Text('save'))
//      ],
//    );
//  }

  final email = TextEditingController();
  final name = TextEditingController();
  final lastname = TextEditingController();
  final Dob = TextEditingController();


  final Mobilenum = TextEditingController();

  final bio = TextEditingController();
  final weight = TextEditingController();
  final height = TextEditingController();


  final profession = TextEditingController();
  final interest = TextEditingController();
  final fburl = TextEditingController();
  final instaurl = TextEditingController();
  final twitterurl = TextEditingController();

  final hobbies = TextEditingController();
  bool loading = false;
  var _selectedBDate;
//  String? profileImage;
//  i.File? selectedImage;


  ItemProfileOption? hairOption;
  ItemProfileOption? statusOption;
  ItemProfileOption? eyesOption;
  ItemProfileOption? bodyOption;
  ItemProfileOption? genderoption;



  String validatePass(value) {
    if (value.isEmpty) {
      return 'Required *';
    }
    return "";
  }

  @override
  void initState() {
    super.initState();
    if (widget.module != null) {
      email.text = widget.module?.email ?? '';
      name.text = widget.module?.firstName ?? '';
      lastname.text = widget.module?.lastName ?? '';
      Mobilenum.text = widget.module?.phoneNumber ?? '';
      Dob.text = widget.module?.birthDate?.split("T").first ?? '';
      fburl.text = widget.module?.socialMediaLink1 ?? '';
      instaurl.text = widget.module?.socialMediaLink2 ?? '';
      twitterurl.text = widget.module?.socialMediaLink3 ?? '';
      hobbies.text = widget.module?.hobbies ?? "";
      weight.text = widget.module?.weight.toString() ?? "";
      height.text = widget.module?.height.toString() ?? "";

      if(widget.module?.hairId != null) {
        hairOption  =ItemProfileOption(widget.module?.hairId ?? -1, widget.module?.hair ?? '');
      }
      if(widget.module?.eyesId != null) {
        eyesOption  =ItemProfileOption(widget.module?.eyesId ?? -1, widget.module?.eyes ?? '');
      }
      if(widget.module?.bodyTypeId != null) {
        bodyOption  =ItemProfileOption(widget.module?.bodyTypeId ?? -1, widget.module?.bodyType ?? '');
      }
      if(widget.module?.maritalStatusId != null) {
        statusOption  =ItemProfileOption(widget.module?.maritalStatusId ?? -1, widget.module?.maritalStatus ?? '');
      }

      if(widget.module?.genderId != null) {
        genderoption  =ItemProfileOption(widget.module?.genderId ?? -1, widget.module?.gender ?? '');
      }

      interest.text = widget.module?.profession ?? "";
      profession.text = widget.module?.interests ?? "";
//      profileImage = widget.module?.imageUrl ?? '';
//      EDUCTIONS = module?.education ?? [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 18),
                      controller: name,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "First Name",
                        hintText: "First Name",
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
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 18),
                      controller: lastname,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Last Name",
                        hintText: "Last Name",
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
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 18),
                      controller: email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Email",
                        hintText: " Email",
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
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 18),
                      controller: Mobilenum,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Mobile",
                        hintText: " Mobile",
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 0, color: Colors.black12)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: MultiValidator([
                        EmailValidator(errorText: 'Not a valid number'),
                      ]),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
//                        onTap: _presentDatePickerTO,
                    cursorColor: YellowColor,
                    style: const TextStyle(fontSize: 18),
                    controller: Dob,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "date of birth",
                      hintText: " Date of birth",
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
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  ////////////////////////////////---------------DropDown -------------////////////////////

                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                    ),
                    child: DropdownButtonFormField<ItemProfileOption>(
                      // Initial Value
                      value: hairOption,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: ItemProfileOption.getHairList()
                          .map((ItemProfileOption items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 8),
                            child: Text(items.name),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (ItemProfileOption? newValue) {
                        print(newValue);
                        hairOption = newValue!;
                      },
                      isExpanded: true,
//                          underline: Container(),
                      hint: Text('Select hair'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                    ),
                    child: DropdownButtonFormField<ItemProfileOption>(
                      // Initial Value
                      value: eyesOption,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: ItemProfileOption.getEyesList()
                          .map((ItemProfileOption items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 8),
                            child: Text(items.name),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (ItemProfileOption? newValue) {
                        print(newValue);
                        eyesOption = newValue!;
                      },
                      isExpanded: true,
//                          underline: Container(),
                      hint: Text('Select Eyes'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                    ),
                    child: DropdownButtonFormField<ItemProfileOption>(
                      // Initial Value
                      value: bodyOption,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: ItemProfileOption.getBodyTypeList()
                          .map((ItemProfileOption items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 8),
                            child: Text(items.name),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (ItemProfileOption? newValue) {
                        print(newValue);
                        bodyOption = newValue!;
                      },
                      isExpanded: true,
//                          underline: Container(),
                      hint: Text('Select bodyType'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                    ),
                    child: DropdownButtonFormField<ItemProfileOption>(
                      // Initial Value
                      value: statusOption,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: ItemProfileOption.getMaritalStatusList()
                          .map((ItemProfileOption items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 8),
                            child: Text(items.name),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (ItemProfileOption? newValue) {
                        print(newValue);
                        statusOption = newValue!;
                      },
                      isExpanded: true,
//                          underline: Container(),
                      hint: Text('Select Marital Status'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                    ),
                    child: DropdownButtonFormField<ItemProfileOption>(
                      // Initial Value
                      value: genderoption,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: ItemProfileOption.getGenderList()
                          .map((ItemProfileOption items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 8),
                            child: Text(items.name),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (ItemProfileOption? newValue) {
                        print(newValue);
                        genderoption = newValue!;
                      },
                      isExpanded: true,
//                          underline: Container(),
                      hint: Text('Gender'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 18),
                      controller: bio,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Bio",
                        hintText: " Bio",
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 18),
                      controller: weight,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Weight (kg)",
                        hintText: "Weight (kg)",
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 18),
                      controller: height,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Height (cm)",
                        hintText: "Height (cm)",
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 18),
                      controller: interest,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Interest",
                        hintText: "Interest",
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 18),
                      controller: profession,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Profession",
                        hintText: "Profession",
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 18),
                      controller: hobbies,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Hobbies",
                        hintText: "Hobbies",
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
                ])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              "Social Media",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormField(
                cursorColor: YellowColor,
                style: const TextStyle(fontSize: 18),
                controller: fburl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Facebook Url",
                  hintText: " Facebook Url",
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormField(
                cursorColor: YellowColor,
                style: const TextStyle(fontSize: 18),
                controller: instaurl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Instagram Url",
                  hintText: " Instagram Url",
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormField(
                cursorColor: YellowColor,
                style: const TextStyle(fontSize: 18),
                controller: twitterurl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Twitter Url",
                  hintText: " Twitter Url",
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CustomButton(
              buttonTab: () {
//                if (genderoption?.id == null || statusOption?.id == null || eyesOption?.id == null || hairOption?.id == null || bodyOption?.id == null
//                )  {
//                  Fluttertoast.showToast(msg: 'select the item in list');
//                }else{
                  loading = true;
                  setState(() {

                  });
                  widget.updateBasicInfo(UpdateProfileRequest(
                    // Image: Image,
                      AboutMe: bio.text,
//                      ImageFile: selectedImage.toString(),
                      ImageFile: null,
                      Birthdate: Dob.text,
                      GenderId: genderoption?.id ,
                      MaterialStatus: statusOption?.id,
                      Height: double.parse("${height.text}"),
                      Weight: double.parse("${weight.text}"),
                      BodyType: bodyOption?.id,
                      LastName: lastname.text,
                      Eyes: eyesOption?.id,
                      FirstName: name.text,
                      Hair: hairOption?.id,
                      Hobbies: hobbies.text,
                      Interests: interest.text,
                      Profession: profession.text,
                      SocialMediaLink1: fburl.text,
                      SocialMediaLink2: instaurl.text,
                      SocialMediaLink3: twitterurl.text));
//                }

              },
              loading: loading,
              text: 'Save',
              bgColor: YellowColor,
              textColor: Colors.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
