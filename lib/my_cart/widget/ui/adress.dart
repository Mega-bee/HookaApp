import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    final Label = TextEditingController();
    final City = TextEditingController();
    final Area = TextEditingController();
    final Adressline1 = TextEditingController();
    final Adressline2 = TextEditingController();
    final Landline = TextEditingController();
    final Pobox = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text("Add New Adress",style: TextStyle(color:Primarycolor),),
      ),
      body:

      SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.05),
            child: TextFormField(
                cursorColor: YellowColor,
                style: const TextStyle(fontSize: 18),
                controller:Label,
                decoration: InputDecoration(

                  filled: true,
                  fillColor: Colors.white,
                  labelText: " Label",
                  hintText: " Label",
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
                  RequiredValidator(errorText: 'Label Required *'),

                ]),
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.05),
            child: TextFormField(
                cursorColor: YellowColor,
                style: const TextStyle(fontSize: 18),
                controller:City,
                decoration: InputDecoration(

                  filled: true,
                  fillColor: Colors.white,
                  labelText:" City" ,
                  hintText: " City",
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
                  RequiredValidator(errorText: 'City is Required *'),

                ]),
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.05),
            child: TextFormField(
                cursorColor: YellowColor,
                style: const TextStyle(fontSize: 18),
                controller:Area,
                decoration: InputDecoration(

                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Area",
                  hintText: " Area",
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
                  RequiredValidator(errorText: 'Area is Required *'),

                ]),
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.05),
            child: TextFormField(

                cursorColor: YellowColor,
                style: const TextStyle(fontSize: 18),
                controller:Adressline1,
                decoration: InputDecoration(

                  filled: true,
                  fillColor: Colors.white,
                  labelText:" Address Line 1" ,
                  hintText: " Address Line 1",
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
                  RequiredValidator(errorText: 'Adress is Required *'),

                ]),
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.05),
            child: TextFormField(

                cursorColor: YellowColor,
                style: const TextStyle(fontSize: 18),
                controller:Adressline2,
                decoration: InputDecoration(

                  filled: true,
                  fillColor: Colors.white,
                  labelText:" Address Line 2" ,
                  hintText: " Address Line 2",
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
                  RequiredValidator(errorText: 'Adress is Required *'),

                ]),
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.05),
            child: TextFormField(

                cursorColor: YellowColor,
                style: const TextStyle(fontSize: 18),
                controller:Landline,
                decoration: InputDecoration(

                  filled: true,
                  fillColor: Colors.white,
                  labelText:" LandLine*" ,
                  hintText: " LandLine*",
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
                  RequiredValidator(errorText: 'Landline is Required *'),

                ]),
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.05),
            child: TextFormField(

                cursorColor: YellowColor,
                style: const TextStyle(fontSize: 18),
                controller:Pobox,
                decoration: InputDecoration(

                  filled: true,
                  fillColor: Colors.white,
                  labelText:" PO BOx" ,
                  hintText: " PO BOx",
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
                  RequiredValidator(errorText: 'Po Box is Required *'),

                ]),
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),

            child: Card(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  children: [




                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Adress On Map*",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.23,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.045,
                      width: MediaQuery.of(context).size.width*0.25,

                      child: Card(
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        color: Colors.black,
                        child: Center(child: Text(" Set On Map ",style: TextStyle(color: YellowColor,fontSize: 12,fontWeight: FontWeight.bold),)),),
                    )
                  ],),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          ElevatedButton(
            onPressed: () {},
//

            child: const Text(
              'SAVE ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto-Bold'),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.15,
                  vertical: MediaQuery.of(context).size.height * 0.018),
              primary: YellowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ],),
      ),
    );
  }
}
