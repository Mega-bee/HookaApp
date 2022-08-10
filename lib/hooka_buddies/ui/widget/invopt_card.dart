import 'package:flutter/material.dart';

import '../../response/invitation_options_response.dart';

class InvOptionCard extends StatefulWidget {
  final InvitationOptionsResponse invoptmodel;
  InvOptionCard(this.invoptmodel);

  @override
  State<InvOptionCard> createState() => _InvOptionCardState();
}

class _InvOptionCardState extends State<InvOptionCard> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 50,
      child: CheckboxListTile(selected: _value,title: Text(widget.invoptmodel.title.toString()),
        activeColor: Colors.black,
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value!;
          });



        },),
    );
  }
}
