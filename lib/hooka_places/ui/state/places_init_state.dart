import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooka/hooka_places/request/filter_places_request.dart';
import 'package:hooka/hooka_places/response/places_response.dart';

import '../../../abstracts/states/state.dart';
import '../../../hooka_buddies/ui/widget/SearchWidgetBuddies.dart';
import '../../../module_deep_links/service/deep_links_service.dart';
import '../../request/isfav_request.dart';
import '../../response/cuisine_response.dart';
import '../screen/hooka_places.dart';
import '../widget/places_card.dart';

class PlaceInitState extends States {
  final List<PlacesResp> placesModell;
  List<CuisinesResponse>? items;
  final HookaPlacesState hookaPlacesState;
  String? lon;

  String? lat;

  PlaceInitState(this.hookaPlacesState, this.lon, this.lat,
      {required this.placesModell, required this.items})
      : super() {
    searchList = placesModell;
  }

  String query = '';

  String dropdownvalue = "Cuisines";

  bool? fav;
  bool? f;
  int? Id;
  List ids = [];

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
            Color.fromRGBO(211, 211, 211, 0.9),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
          stops: [0.4, 1.0],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Column(children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchWidgetBuddies(
              onFilterPress: () {
                hookaPlacesState.request!.sortby = 0;
                hookaPlacesState.getPlacesss(FilterRequest(0, 0, lon, lat, []));
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
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: 42,
                width: 140,
                child: Card(
                  elevation: 1,
                  shape: BeveledRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                      width: 0.4,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: DropdownButton(
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(dropdownvalue),
                    ),
                    style: TextStyle(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                    dropdownColor: Colors.grey.shade100,
                    underline: Container(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    isExpanded: true,
                    items: items?.map((e) {
                      return DropdownMenuItem(
                        onTap: () {
                          e.selected = !e.selected!;
                          print("hhhh");
                          print(e.selected);

                          f = e.selected;
                          hookaPlacesState.refresh();

                          print(f);
                        },
                        value: e.id,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: f == false
                              ? Wrap(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(e.title.toString()),
                                      Icon(
                                        CupertinoIcons.check_mark,
                                        size: 10,
                                      )
                                    ],
                                  ),
                                ])
                              : Text(e.title.toString()),
                        ),
                      );
                    }).toList(),
                    onChanged: (int? newId) {
                      print(f);

                      f == true ? ids.add(newId) : ids.remove(newId);

                      hookaPlacesState
                          .getPlacesss(FilterRequest(0, 0, lon, lat, ids));

                      Id = newId;
                      print(Id);
                      print(ids);
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              FilterChip(
                elevation: 1,
                onSelected: (bool value) {
                  print(hookaPlacesState.Selected);

                  value = !value;
                  print("cocopleaseeeeeee");
                  print(value);
                  hookaPlacesState.Selected = !hookaPlacesState.Selected;
                  value = hookaPlacesState.Selected;
                  print(value);
                  if (value == true &&
                      hookaPlacesState.Selected2 == true &&
                      hookaPlacesState.Selected3 == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(2, 1, lon, lat, []));
                  } else if (value == true &&
                      hookaPlacesState.Selected2 == false &&
                      hookaPlacesState.Selected3 == true) {
                    hookaPlacesState.Selected3 = false;
                    hookaPlacesState
                        .getPlacesss(FilterRequest(2, 0, lon, lat, []));
                  } else if (value == true &&
                      hookaPlacesState.Selected3 == false &&
                      hookaPlacesState.Selected2 == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(2, 0, lon, lat, []));
                  } else if (value == false &&
                      hookaPlacesState.Selected3 == true &&
                      hookaPlacesState.Selected2 == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(1, 0, lon, lat, []));
                  } else if (value == false &&
                      hookaPlacesState.Selected3 == false &&
                      hookaPlacesState.Selected2 == true) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(0, 1, lon, lat, []));
                  } else if (value == false &&
                      hookaPlacesState.Selected3 == false &&
                      hookaPlacesState.Selected2 == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(0, 0, lon, lat, []));
                  }
                  hookaPlacesState.refresh();
                },
                label: Row(
                  children: [
                    hookaPlacesState.Selected == true
                        ? Row(
                            children: [
                              Icon(
                                Icons.check,
                                size: 10,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          )
                        : Container(),
                    Text("Nearest",
                        style:
                            GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),
                  ],
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              FilterChip(
                elevation: 1,
                onSelected: (bool value) {
                  print(hookaPlacesState.Selected);

                  value = !value;
                  print("cocopleaseeeeeee");
                  print(value);
                  hookaPlacesState.Selected2 = !hookaPlacesState.Selected2;
                  value = hookaPlacesState.Selected2;
                  print(value);
                  if (value == true &&
                      hookaPlacesState.Selected == true &&
                      hookaPlacesState.Selected3 == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(2, 1, lon, lat, []));
                  } else if (value == true &&
                      hookaPlacesState.Selected == false &&
                      hookaPlacesState.Selected3 == true) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(1, 1, lon, lat, []));
                  } else if (value == true &&
                      hookaPlacesState.Selected3 == false &&
                      hookaPlacesState.Selected == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(0, 1, lon, lat, []));
                  } else if (value == false &&
                      hookaPlacesState.Selected3 == true &&
                      hookaPlacesState.Selected == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(1, 0, lon, lat, []));
                  } else if (value == false &&
                      hookaPlacesState.Selected3 == false &&
                      hookaPlacesState.Selected == true) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(2, 0, lon, lat, []));
                  } else if (value == false &&
                      hookaPlacesState.Selected3 == false &&
                      hookaPlacesState.Selected == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(0, 0, lon, lat, []));
                  }

                  hookaPlacesState.refresh();
                },
                label: Row(
                  children: [
                    hookaPlacesState.Selected2 == true
                        ? Row(
                            children: [
                              Icon(
                                Icons.check,
                                size: 10,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          )
                        : Container(),
                    Text("Favorites",
                        style:
                            GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),
                  ],
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              FilterChip(
                elevation: 1,
                onSelected: (bool value) {
                  print(hookaPlacesState.Selected);

                  value = !value;
                  print("cocopleaseeeeeee");
                  print(value);
                  hookaPlacesState.Selected3 = !hookaPlacesState.Selected3;
                  value = hookaPlacesState.Selected3;
                  print(value);
                  if (value == true &&
                      hookaPlacesState.Selected2 == true &&
                      hookaPlacesState.Selected == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(1, 1, lon, lat, []));
                  } else if (value == true &&
                      hookaPlacesState.Selected2 == false &&
                      hookaPlacesState.Selected == true) {
                    hookaPlacesState.Selected = false;
                    hookaPlacesState
                        .getPlacesss(FilterRequest(1, 0, lon, lat, []));
                  } else if (value == true &&
                      hookaPlacesState.Selected == false &&
                      hookaPlacesState.Selected2 == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(1, 0, lon, lat, []));
                  } else if (value == false &&
                      hookaPlacesState.Selected == true &&
                      hookaPlacesState.Selected2 == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(2, 0, lon, lat, []));
                  } else if (value == false &&
                      hookaPlacesState.Selected == false &&
                      hookaPlacesState.Selected2 == true) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(0, 1, lon, lat, []));
                  } else if (value == false &&
                      hookaPlacesState.Selected == false &&
                      hookaPlacesState.Selected2 == false) {
                    hookaPlacesState
                        .getPlacesss(FilterRequest(0, 0, lon, lat, []));
                  }
                  hookaPlacesState.refresh();
                },
                label: Row(
                  children: [
                    hookaPlacesState.Selected3 == true
                        ? Row(
                            children: [
                              Icon(
                                Icons.check,
                                size: 10,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          )
                        : Container(),
                    Text(
                      "Rating",
                      style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Popular restaurent arround you ",
                style: GoogleFonts.anekLatin(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
            )),
        Expanded(
          child: ListView.builder(
              itemCount: searchList!.length,
              itemBuilder: (context, index) {
                final PlacesList = searchList![index];
                return PlacesCard(
                  modelp: PlacesList,
                  isFavFunc: (bool fav) {
                    fav = !fav;
                    hookaPlacesState.refresh();
                    hookaPlacesState.isFav(
                        IsFavorite(
                          isFav: fav,
                        ),
                        PlacesList.id.toString());
                  },
                );
              }),
        ),
      ]),
    );
  }
}
