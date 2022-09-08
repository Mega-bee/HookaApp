import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooka/hooka_places/response/places_response.dart';

import '../../../abstracts/states/state.dart';
import '../../../hooka_buddies/ui/widget/SearchWidgetBuddies.dart';
import '../screen/hooka_places.dart';
import '../widget/SearchWidgetHookahPlaces.dart';
import '../widget/places_card.dart';

class PlaceInitState extends States {
  final List<PlacesResp> placesModell;
  final HookaPlacesState hookaPlacesState;
  PlaceInitState(this.hookaPlacesState, {required this.placesModell}): super() {
    searchList = placesModell;
  }
  String query = '';
  bool Selected=false;
  bool Selected1=false;
  List<PlacesResp>? searchList;
  @override
  Widget getUI(BuildContext context) {
    final _textEditingController = TextEditingController();
    return Column(children: [
      SearchWidgetBuddies(
        onFilterPress: (){
          hookaPlacesState.request!.sortby=0;
          hookaPlacesState.getPlacesss();

        },

        hintText: "Search",
        text: query,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          print(searchText);
          print("search test");
          searchList = placesModell
              .where(
                (string) => (string.name!).toLowerCase().contains(
              searchText.toLowerCase(),
            ),
          )
              .toList();
          hookaPlacesState.refresh();
        },
      ),

      Container(color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            FilterChip(
              onSelected: (bool value){

              },

              label:Row(
                children: [

Icon(Icons.sort,size: 10,),
                  SizedBox(width: MediaQuery.of(context).size.width*0.01,),

                  Text("Sort By"),
                  SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                  Icon(Icons.arrow_drop_down_outlined,size: 12,),
                ],
              ),
              backgroundColor: Colors.white,

              shape: RoundedRectangleBorder(
                side: BorderSide(color:Colors.black12 ),
                borderRadius: BorderRadius.circular(5.0,),

              ),),
            FilterChip(
              onSelected: (bool value){

              },

              label:Row(
                children: [


                  Text("Cuisines"),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  Icon(Icons.arrow_drop_down_outlined,size: 12,),
                ],
              ),
              backgroundColor: Colors.white,

              shape: RoundedRectangleBorder(
                side: BorderSide(color:Colors.black12 ),
                borderRadius: BorderRadius.circular(5.0,),

              ),),
            FilterChip(
              onSelected: (bool value){
Selected=!Selected;
hookaPlacesState.refresh();
              },

              label:Row(
                children: [

Selected==true?Row(
  children: [
        Icon(Icons.check,size: 10,), SizedBox(width: 3,),
  ],
):Container(),

                  Text("Nearest"),

                ],
              ),
              backgroundColor: Colors.white,

              shape: RoundedRectangleBorder(
                side: BorderSide(color:Colors.black12 ),
                borderRadius: BorderRadius.circular(5.0,),

              ),),
            FilterChip(
              onSelected: (bool value){
                Selected1=!Selected1;
                hookaPlacesState.refresh();
              },

              label:Row(
                children: [

                  Selected1==true?Row(
                    children: [
                      Icon(Icons.check,size: 10,), SizedBox(width: 3,),
                    ],
                  ):Container(),

                  Text("Rating"),

                ],
              ),
              backgroundColor: Colors.white,

              shape: RoundedRectangleBorder(
                side: BorderSide(color:Colors.black12 ),
                borderRadius: BorderRadius.circular(5.0,),

              ),),


          ],
        ),
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text("Popular restaurent arround you ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          )),

      Expanded(
        child: ListView.builder(
            itemCount: searchList!.length,

            itemBuilder: (context, index) {
              final PlacesList = searchList![index];
              return PlacesCard(modelp: PlacesList);
            }),
      ),

    ]);
  }
}
