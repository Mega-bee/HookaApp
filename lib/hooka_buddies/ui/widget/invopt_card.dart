import 'package:flutter/material.dart';

import '../../response/invitation_options_response.dart';

class InvOptionCard extends StatefulWidget {
  final InvitationOptionsResponse invoptmodel;
  final Function onSelectOption;
  InvOptionCard( {required this.invoptmodel,required this.onSelectOption});

  @override
  State<InvOptionCard> createState() => _InvOptionCardState();
}

class _InvOptionCardState extends State<InvOptionCard> {


  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 50,
      child: CheckboxListTile(selected: widget.invoptmodel.selected,title: Text(widget.invoptmodel.title.toString()),
        activeColor: Colors.black,
        value:  widget.invoptmodel.selected,
        onChanged: (value) {
          setState(() {
            widget.invoptmodel.selected =  !widget.invoptmodel.selected;
          });
          widget.onSelectOption();


        },),
    );
  }
}
