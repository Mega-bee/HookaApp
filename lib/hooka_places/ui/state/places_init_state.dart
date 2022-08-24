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
  List<PlacesResp>? searchList;
  @override
  Widget getUI(BuildContext context) {
    final _textEditingController = TextEditingController();
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchWidgetBuddies(
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
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      // Padding(
      //     padding: EdgeInsets.symmetric(
      //         horizontal: MediaQuery.of(context).size.width * 0.05),
      //     child: SearchWidgetHookahPlaces(
      //       hintText: "Search",
      //       onChanged: searchPlaces,
      //       text: query,)
      // ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),

      Expanded(
        child: Card(
            child: ListView.builder(
                itemCount: searchList!.length,
                itemBuilder: (context, index) {
                  final PlacesList = searchList![index];
                  return PlacesCard(modelp: PlacesList);
                })),
      )
    ]);
  }
}
