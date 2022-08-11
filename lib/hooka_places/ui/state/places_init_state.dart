import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooka/hooka_places/response/places_response.dart';

import '../../../abstracts/states/state.dart';
import '../screen/hooka_places.dart';
import '../widget/SearchWidgetHookahPlaces.dart';
import '../widget/places_card.dart';

class PlaceInitState extends States {
  final List<PlacesResp> placesModell;
  final HookaPlacesState hookaPlacesState;
  PlaceInitState(this.hookaPlacesState, {required this.placesModell});

  @override
  Widget getUI(BuildContext context) {
    final _textEditingController = TextEditingController();
    return Column(children: [
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
                itemCount: placesModell.length,
                itemBuilder: (context, index) {
                  final PlacesList = placesModell[index];
                  return PlacesCard(modelp: PlacesList);
                })),
      )
    ]);
  }
}
