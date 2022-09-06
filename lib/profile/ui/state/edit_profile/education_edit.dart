import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/profile/request/add_adress.dart';
import 'package:hooka/profile/request/add_education_request.dart';
import 'package:hooka/profile/response/profile_response.dart';
import 'package:hooka/profile/ui/widget/education_card.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:hooka/utils/style/colors.dart';

class EducationEditState extends StatefulWidget {
  List<Education> _education;
  final Function? addEducation;
  final Function? removeEducation;
  int? gender;

  EducationEditState(this._education, this.gender,
      {this.addEducation, this.removeEducation});

  @override
  _EducationEditStateState createState() => _EducationEditStateState();
}

class _EducationEditStateState extends State<EducationEditState> {
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
      body: widget._education.isNotEmpty
          ? ListView.builder(
              itemCount: widget._education.length,
              itemBuilder: (context1, index) {
                final mod = widget._education[index];
                return EducationCard(
                  mod,
                  widget.gender ?? 0,
                  true,
                  removeItem: () {
                    widget._education.removeAt(index);
                    widget.removeEducation!(mod.id);
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
                  ImageAsset.Education,
                  height: 200,
                ),
                Text('No education added')
              ],
            )),
    );
  }

  addEducationAlert() {
    var universityConntrollre = TextEditingController();
    var dagreeConntrollre = TextEditingController();
    DateTime? _from = DateTime.now();
    DateTime? _to = DateTime.now();
    return AlertDialog(
      elevation: 5.0,
      scrollable: true,
      title: Text('Add new education'),
      content: StatefulBuilder(
        builder: (context, setStateAlert) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              cursorColor: YellowColor,
              style: const TextStyle(fontSize: 18),
              controller: universityConntrollre,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "University Name",
                hintText: "name",
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
              controller: dagreeConntrollre,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Degree  ",
                hintText: "degree",
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
              height: 20,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () async {
                    _from = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2025));
                    setStateAlert(() {});
                  },
                  child: Row(
                    children: [
                      Text(
                        'From: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_from.toString().split(' ').first)
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    _to = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2025));
                    setStateAlert(() {});
                  },
                  child: Row(
                    children: [
                      Text(
                        'To: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_to.toString().split(' ').first)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              if (universityConntrollre.text.isNotEmpty&&dagreeConntrollre.text.isNotEmpty){
              Navigator.pop(context);
              widget._education.add(Education(
                  degree: dagreeConntrollre.text,
                  studiedTo: _to.toString().split(' ').first,
                  studiedFrom: _from.toString().split(' ').first,
                  university: universityConntrollre.text));
              widget.addEducation!(AddEducationRequest(Degree: dagreeConntrollre.text,
                  StudiedFrom: _from.toString().split(' ').first, StudiedTo: _to.toString().split(' ').first, University: universityConntrollre.text));

              setState(() {});}else{
               Fluttertoast.showToast(msg: "Please Fill The University And Degree Field");
              }
            },
            child: Text('Add'))
      ],
    );
  }
}
