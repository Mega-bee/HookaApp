import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool Selected3=false;
  List<PlacesResp>? searchList;
  @override
  Widget getUI(BuildContext context) {
    final _textEditingController = TextEditingController();
    return Container(
      height: 900,
      decoration: BoxDecoration(

        gradient: LinearGradient(
          colors: [
            Colors.white,
            Color.fromRGBO(211,211,211, 0.9),
          ],
          begin:  FractionalOffset(0.0, 0.0),
          end:  FractionalOffset(0.0, 1.0),
          stops: [0.4, 1.0],
          tileMode: TileMode.repeated,

        ),
      ),
      child: Column(children: [
        Container(color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),

            child: SearchWidgetBuddies(
              onFilterPress: (){
                hookaPlacesState.request!.sortby=0;
                hookaPlacesState.getPlacesss();

              },

              hintText: "Restaurant name...",

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
          ),
        ),

        Container(color: Colors.white,
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(width: 10,),
              FilterChip(
                elevation: 1,
                onSelected: (bool value){

                },

                label:Row(
                  children: [


                    Text("Cuisines",style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    Icon(Icons.arrow_drop_down_outlined,size: 12,),
                  ],
                ),
                backgroundColor: Colors.white,

                shape: RoundedRectangleBorder(
                  side: BorderSide(color:Colors.black12 ),
                  borderRadius: BorderRadius.circular(5.0,),

                ),),
              SizedBox(width: 10,),
              FilterChip(
                elevation: 1,
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

                    Text("Nearest",style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),

                  ],
                ),
                backgroundColor: Colors.white,

                shape: RoundedRectangleBorder(
                  side: BorderSide(color:Colors.black12 ),
                  borderRadius: BorderRadius.circular(5.0,),

                ),),
              SizedBox(width: 10,), FilterChip(
                elevation: 1,
                onSelected: (bool value){
Selected3=!Selected3;
hookaPlacesState.refresh();
                },

                label:Row(
                  children: [

Selected3==true?Row(
  children: [
          Icon(Icons.check,size: 10,), SizedBox(width: 3,),
  ],
):Container(),

                    Text("Favorites",style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),

                  ],
                ),
                backgroundColor: Colors.white,

                shape: RoundedRectangleBorder(
                  side: BorderSide(color:Colors.black12 ),
                  borderRadius: BorderRadius.circular(5.0,),

                ),),
              SizedBox(width: 10,),
              FilterChip(
                elevation: 1,
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

                    Text("Rating",style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600),),

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
              child: Text("Popular restaurent arround you ",style: GoogleFonts.anekLatin(fontWeight: FontWeight.bold,fontSize: 18),),
            )),

        Expanded(
          child: ListView.builder(
              itemCount: searchList!.length,

              itemBuilder: (context, index) {
                final PlacesList = searchList![index];
                return PlacesCard(modelp: PlacesList);
              }),
        ),

      ]),
    );
  }
}
