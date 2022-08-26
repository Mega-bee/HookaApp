import 'package:flutter/material.dart';
import 'package:hooka/profile/request/add_adress.dart';
import 'package:hooka/profile/request/add_education_request.dart';
import 'package:hooka/profile/request/add_experience_request.dart';
import 'package:hooka/profile/response/profile_response.dart';
import 'package:hooka/profile/ui/widget/education_card.dart';
import 'package:hooka/profile/ui/widget/experience_card.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:hooka/utils/style/colors.dart';

class ExperinceEditState extends StatefulWidget {
  List<Experience> _education;
  final Function? addExp;
  final Function? removeExp;


  ExperinceEditState(this._education,
      {this.addExp, this.removeExp});

  @override
  _ExperinceEditStateState createState() => _ExperinceEditStateState();
}

class _ExperinceEditStateState extends State<ExperinceEditState> {
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
                return ExperienceCard(
                  mod,
                  true,
                  removeItem: () {
                    widget._education.removeAt(index);
                    widget.removeExp!(mod.id);
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
                Text('No experince added')
              ],
            )),
    );
  }

  addEducationAlert() {
    var placeConntrollre = TextEditingController();
    var positionConntrollre = TextEditingController();
    DateTime? _from = DateTime.now();
    DateTime? _to = DateTime.now();
    return AlertDialog(
      elevation: 5.0,
      scrollable: true,
      title: Text('Add new experience'),
      content: StatefulBuilder(
        builder: (context, setStateAlert) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              cursorColor: YellowColor,
              style: const TextStyle(fontSize: 18),
              controller: placeConntrollre,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Place Name",
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
              controller: positionConntrollre,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Position  ",
                hintText: "position",
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
              Navigator.pop(context);
              widget._education.add(Experience(
                  place: placeConntrollre.text,
                  workedTo: _to.toString().split(' ').first,
                  workedFrom: _from.toString().split(' ').first,
                  position: positionConntrollre.text));

              widget.addExp!(AddExperienceRequest(Place: placeConntrollre.text,
                  WorkedFrom: _from.toString().split(' ').first, WorkedTo: _to.toString().split(' ').first, Position: positionConntrollre.text));

              setState(() {});
            },
            child: Text('Add'))
      ],
    );
  }
}
