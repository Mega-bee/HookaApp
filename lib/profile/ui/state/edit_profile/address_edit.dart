import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/profile/request/add_adress.dart';
import 'package:hooka/profile/request/add_education_request.dart';
import 'package:hooka/profile/request/add_experience_request.dart';
import 'package:hooka/profile/response/profile_response.dart';
import 'package:hooka/profile/ui/widget/address_card.dart';
import 'package:hooka/profile/ui/widget/education_card.dart';
import 'package:hooka/profile/ui/widget/experience_card.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:hooka/utils/style/colors.dart';

class AddressEditState extends StatefulWidget {
  List<Addresses> _addressList;
  final Function? addAddress;
  final Function? removeAddress;

  AddressEditState(this._addressList, {this.addAddress, this.removeAddress});

  @override
  _AddressEditStateState createState() => _AddressEditStateState();
}

class _AddressEditStateState extends State<AddressEditState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => addEducationAlert(),
            );
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: YellowColor,
          )),
      body: widget._addressList.isNotEmpty
          ? ListView.builder(
              itemCount: widget._addressList.length,
              itemBuilder: (context1, index) {
                final mod = widget._addressList[index];
                return AddressCard(
                  mod,
                  true,
                  removeItem: () {
                    widget._addressList.removeAt(index);
                    widget.removeAddress!(mod.id);
                    setState(() {});
                  },
                );
              },
              shrinkWrap: true,
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAsset.Experience,
                  height: 200,
                ),
                Text('No Address added')
              ],
            )),
    );
  }

  addEducationAlert() {
    var titleController = TextEditingController();
    var cityConntrollre = TextEditingController();
    var streetConntrollre = TextEditingController();
    var buildingConntrollre = TextEditingController();
    return AlertDialog(
      elevation: 5.0,
      scrollable: true,
      title: Text('Add new address'),
      content: StatefulBuilder(
        builder: (context, setStateAlert) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              cursorColor: YellowColor,
              style: const TextStyle(fontSize: 18),
              controller: titleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Address title * ",
                hintText: "title",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 0, color: Colors.black12)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              cursorColor: YellowColor,
              style: const TextStyle(fontSize: 18),
              controller: cityConntrollre,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "City * ",
                hintText: "city",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 0, color: Colors.black12)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              cursorColor: YellowColor,
              style: const TextStyle(fontSize: 18),
              controller: streetConntrollre,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Street * ",
                hintText: "street",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 0, color: Colors.black12)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              cursorColor: YellowColor,
              style: const TextStyle(fontSize: 18),
              controller: buildingConntrollre,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Building * ",
                hintText: "building ",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 0, color: Colors.black12)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              if(titleController.text.isNotEmpty&&cityConntrollre.text.isNotEmpty&&streetConntrollre.text.isNotEmpty&&buildingConntrollre.text.isNotEmpty){
              Navigator.pop(context);
              widget._addressList.add(Addresses(
                  title: titleController.text,
                  city: cityConntrollre.text,
                  street: streetConntrollre.text,
                  building: buildingConntrollre.text));

              widget.addAddress!(AddAddressRequest(
                  Title: titleController.text,
                  Building: buildingConntrollre.text,
                  City: cityConntrollre.text,
                  Street: streetConntrollre.text));

              setState(() {});}else{
                Fluttertoast.showToast(msg: "Please Fill All The Field");
              }

            },
            child: Text('Add'))
      ],
    );
  }
}
