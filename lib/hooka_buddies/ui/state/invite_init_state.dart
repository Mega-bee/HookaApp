import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/auth/ui/widget/custem_button.dart';
import 'package:hooka/hooka_buddies/request/invite_request.dart';
import 'package:hooka/hooka_places/response/places_response.dart';
import 'package:hooka/utils/style/colors.dart';

import '../../../abstracts/states/state.dart';
import 'package:flutter/material.dart';

import '../../response/invitation_options_response.dart';
import '../screens/invite.dart';
import '../widget/invopt_card.dart';

class InviteInitState extends States {
  final List<InvitationOptionsResponse> invoptionresp;
  final List<PlacesResp> placess;
  final InviteBuddiesState inviteBuddiesState;
  InviteInitState(
    this.inviteBuddiesState,
    this.invoptionresp,
    this.placess,
  ) : super() {
    selectedItem = placess.first;
  }

  PlacesResp? selectedItem;
  InvitationOptionsResponse? selectedOption;
  var _messageController = TextEditingController();
  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                      selectedOption = model;
                      inviteBuddiesState.refresh();
                    },
                  );
                }),
            SizedBox(
              height: 15,
            ),
            Text(
              'Choose place  ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownSearch<PlacesResp>(
              popupProps: PopupProps.modalBottomSheet(
                showSelectedItems: true,
                searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                        labelText: "Search palces",
                        hintText: "Search palces",
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelStyle: TextStyle(color: Colors.black))),
                showSearchBox: true,
              ),
              items: placess,
              onChanged: (value) {
                selectedItem = value;
              },
              enabled: true,
              selectedItem: selectedItem,
              itemAsString: (item) {
                return item.name ?? 'chosse the place';
              },
              compareFn: (item1, item2) {
                return true;
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Choose date time',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(
                        width: 15,
                      ),
                      Text(inviteBuddiesState.inviteDate.toString().split(' ').first)
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
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.timer),
                      SizedBox(
                        width: 15,
                      ),
                      Text(inviteBuddiesState.inviteTime.format(context))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              cursorColor: YellowColor,
              keyboardType: TextInputType.multiline,
              controller: _messageController,
              maxLines: 5,
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
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                buttonTab: () {
                  if (_messageController.text.isEmpty ||
                      selectedItem == null ||
                      selectedOption == null) {
                     Fluttertoast.showToast(msg: 'fill all field');
                  }else{
                    inviteBuddiesState.sendInvite(InviteRequest(
                      date: inviteBuddiesState.inviteDate.toIso8601String().split('T').first,
                      description: _messageController.text,
                      optionID: selectedOption?.id ?? -1,
                      placeId: selectedItem?.id ?? -1,
                      time: inviteBuddiesState.inviteTime.format(context),
                      toBuddyId: inviteBuddiesState.toBuddyId
                    ));
                  }

                },
                loading: inviteBuddiesState.loadingSnapshot.connectionState ==
                    ConnectionState.waiting,
                text: 'Send',
                bgColor: YellowColor,
                textColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: inviteBuddiesState.inviteDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != inviteBuddiesState.inviteDate) {
      inviteBuddiesState.inviteDate = picked;
      inviteBuddiesState.refresh();
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != inviteBuddiesState.inviteTime) {
      inviteBuddiesState.inviteTime = picked;
      inviteBuddiesState.refresh();
    }
  }
}
