import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooka/Helpers/colors.dart';

import '../../../../Helpers/tools/picker.dart';
import '../../../../auth/ui/widget/email_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _selectedDateTO;
  var _selectedDate1;
  var _selectedDate2;
  var _selectedDate3;
  var _selectedDate4;

  void _presentDatePickerTO() {
    showDatePicker(

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDateTO = pickedDate;
      });
    });

    print('...');
  }
  void _presentDatePicker1() {
    showDatePicker(

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate1 = pickedDate;
      });
    });

    print('...');
  }
  void _presentDatePicker2() {
    showDatePicker(

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate2 = pickedDate;
      });
    });

    print('...');
  }
  void _presentDatePicker3() {
    showDatePicker(

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate3 = pickedDate;
      });
    });

    print('...');
  }
  void _presentDatePicker4() {
    showDatePicker(

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate4 = pickedDate;
      });
    });

    print('...');
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    final name = TextEditingController();
    final email = TextEditingController();
    final Dob = TextEditingController(text: _selectedDateTO.toString().split(' ').first);
    final Mobilenum = TextEditingController();
    final Gender = TextEditingController();
    final bio = TextEditingController();
    final fburl = TextEditingController();
    final instaurl = TextEditingController();
    final twitterurl = TextEditingController();
    final university = TextEditingController();
    final degree = TextEditingController();
    final place = TextEditingController();
    final position = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text("My Account",style: TextStyle(color: Primarycolor),),

      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.90,
          width: MediaQuery.of(context).size.height * 0.70,
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                  children:[
                    SizedBox(height: mediaQueryHeight*0.02,),

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          height: MediaQuery.of(context).size.height*0.1,width:MediaQuery.of(context).size.width*0.20,
                          child: CircleAvatar(
                            backgroundColor: YellowColor,
                            child:Text("Edit Photo",style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),))
                      ,),
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
                            child: TextFormField(
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text("Experience",style: TextStyle(fontSize: 20,
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
      ),
    );
  }
}
