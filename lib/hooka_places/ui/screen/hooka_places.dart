import 'package:flutter/material.dart';
import 'package:hooka/hooka_places/ui/widget/SearchWidgetHookahPlaces.dart';
import 'package:hooka/hooka_places/ui/widget/places_card.dart';

import '../../../utils/style/colors.dart';
import '../model/places_card_model.dart';
import '../model/places_card_model.dart';
import '../model/places_card_model.dart';
import '../model/places_card_model.dart';

class HookaPlaces extends StatefulWidget {

  @override
  State<HookaPlaces> createState() => _HookaPlacesState();
}

class _HookaPlacesState extends State<HookaPlaces> {
  late List<PlaceModel> placesModel;
  String query = '';

  @override
  void initState() {
    super.initState();

    placesModel = placecard;
  }
  @override
  Widget build(BuildContext context) {
    final _textEditingController =TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text('Places',style: TextStyle(color: Primarycolor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},

        ),
        actions: [
          TextButton(onPressed: (){}, child: Text("Map",style: TextStyle(fontSize: 18),))
        ],
      ) ,
      body:  Column(
        children:[
          SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
          Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: SearchWidgetHookahPlaces(
            hintText: "Search",
            onChanged: searchPlaces,
            text: query,)
        ),
          SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),

          Expanded(
            child: Card(

                    child: ListView.builder(
itemCount:placesModel.length ,
    itemBuilder: (context, index) {
      final PlacesList = placesModel[index];
      return PlacesCard(modelp:PlacesList);


    })),






                )




      ]),
    );
  }
  void searchPlaces(String query) {
    final Places = placecard.where((PlaceModel) {
      final nameLower = PlaceModel.title!.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.placesModel = Places;
    });
  }
}



