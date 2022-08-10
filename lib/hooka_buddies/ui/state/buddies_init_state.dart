

import 'package:flutter/material.dart';
import 'package:hooka/hooka_buddies/response/buddies_response.dart';
import '../../../abstracts/states/state.dart';
import '../../Model/BuddiesModel.dart';
import '../screens/buddies.dart';
import '../widget/SearchWidgetBuddies.dart';
import '../widget/buddies_card.dart';

class BuddiesInitState extends States{
  final List<BuddiesResp> buddresp;

  final BuddiesState buddiesState;
  BuddiesInitState(this.buddiesState,this.buddresp,);


  String query = '';
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    return  Column(
        children:[
          SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child:
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child:
    TextField(
                  controller:_textEditingController ,
                  autofocus: false,
    //               onChanged: (searchText) {
    // searchText = searchText.toLowerCase();
    //
    //
    // b = buddresp
    //     .where(
    // (string) =>
    // (string.name! ).toLowerCase().contains(
    // searchText.toLowerCase(),
    // ),
    // )
    //     .toList();
    // buddiesState.refresh();
    // },

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical:
                        MediaQuery.of(context).size.height * 0.01),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor)),
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: const Color.fromRGBO(18, 108, 242, 1),
                    hintText: 'Search',

                    prefixIcon: const Icon(
                      Icons.search_rounded,
                    ),
                    prefixIconColor: const Color.fromRGBO(157, 157, 157, 1),
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(157, 157, 157, 1),
                        fontSize: 15,
                        fontFamily: 'Roboto-Regular'),
                  ),
                ),
              ),),
              // SearchWidgetBuddies(
              //   hintText: "Search",
              //
              //   // onChanged: searchBuddies,
              //   text: query,
              //   onChanged: (searchText) {
              //   searchText = searchText.toLowerCase();
              //   print(searchText);
              //   print("search test");
              //
              //   b = buddresp
              //       .where(
              //         (string) =>
              //         (string.name! ).toLowerCase().contains(
              //           searchText.toLowerCase(),
              //         ),
              //   )
              //       .toList();
              //   buddiesState.refresh();
              // },
              // ) ),
          SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),

          Expanded(
            child: Card(

                child: ListView.builder(
                    itemCount: buddresp.length,
                    itemBuilder: (context, index) {
                      final BuddiesList = buddresp[index];
                      return BuddiesCard(BuddiesList);
                    })),






          )




        ]);
  }

}