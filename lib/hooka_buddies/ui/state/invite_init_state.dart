import 'package:hooka/utils/style/colors.dart';

import '../../../abstracts/states/state.dart';
import 'package:flutter/material.dart';

import '../../response/invitation_options_response.dart';
import '../screens/invite.dart';
import '../widget/invopt_card.dart';

class InviteInitState extends States {
  final List<InvitationOptionsResponse> invoptionresp;
  final InviteBuddiesState buddiesState;
  InviteInitState(
    this.buddiesState,
    this.invoptionresp,
  );

  @override
  Widget getUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: invoptionresp.length,
            itemBuilder: (context, index) {
              final model = invoptionresp[index];
              return InvOptionCard(
                invoptmodel: model,
                onSelectOption: () {
                  invoptionresp.forEach((element) {
                    element.selected = false;
                  });
                  model.selected = true;
                  buddiesState.refresh();
                },
              );
            }),
        Text('Choose date time'),
        InkWell(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(
                    width: 15,
                  ),
                  Text(buddiesState.inviteDate.toString().split(' ').first)
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: () {
            _selectTime(context);
          },
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.timer),
                  SizedBox(
                    width: 15,
                  ),
                  Text(buddiesState.inviteTime.format(context))
                ],
              ),
            ),
          ),
        ),
        TextFormField(
          cursorColor: YellowColor,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            hintText: " write message",
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 0,
                color: Colors.black12,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: buddiesState.inviteDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != buddiesState.inviteDate) {
      buddiesState.inviteDate = picked;
      buddiesState.refresh();
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != buddiesState.inviteTime) {
      buddiesState.inviteTime = picked;
      buddiesState.refresh();
    }
  }
}
