import 'package:flutter/material.dart';
import 'package:hooka/hooka_places/ui/widget/places_card.dart';

import '../../../utils/style/colors.dart';
import '../model/places_card_model.dart';

class HookaPlaces extends StatefulWidget {
  List<PlaceModel> placecard=[
PlaceModel(
    id: 1,
    title: "King Of Grill",
    image:"assets/images/Unknown.jpeg",
    foodType: "Lebanese",
    location: "Bcharry",
    rate: "2.2"
),
    PlaceModel(
        id: 2,
        title: "Malik TAwouk",
        image:"assets/images/malik tawouk.png",
        foodType: "Fast Food",
        location: "Jounieh",
        rate: "4.2"
    ),
    PlaceModel(
        id: 3,
        title: "Macdonald's",
        image:"assets/images/macdo.jpeg",
        foodType: "Fast Food",
        location: "Jounieh",
        rate: "5.0"
    ),
    PlaceModel(
        id: 4,
        title: "Burger King",
        image:"assets/images/burger king.webp",
        foodType: "Fast Food",
        location: "Jounieh",
        rate: "3.2"
    ),
    PlaceModel(
        id: 5,
        title: "Malik TAwouk",
        image:"assets/images/malik tawouk.png",
        foodType: "Fast Food",
        location: "Jounieh",
        rate: "4.2"
    ),
  ];




  @override
  State<HookaPlaces> createState() => _HookaPlacesState();
}

class _HookaPlacesState extends State<HookaPlaces> {
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
          child: TextField(
            controller: _textEditingController,
            autofocus: false,
            onChanged: (searchText) {
              // searchText = searchText.toLowerCase();
              // print(searchText);
              // print("search test");
              //
              // pat = patient
              //     .where(
              //       (string) =>
              //       (string.firstName! + string.middleName! + string.lastName!).toLowerCase().contains(
              //         searchText.toLowerCase(),
              //       ),
              // )
              //     .toList();
              // setState(() {});
            },
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
              hintText: 'Search ',
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.filter_alt_rounded,
                  color: YellowColor,
                ),
                onPressed: () {}


              ),
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
        ),
          SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),

          Expanded(
            child: Card(

                    child: ListView.builder(
itemCount:widget.placecard.length ,
    itemBuilder: (context, index) {
      return PlacesCard(
modelp: widget.placecard[index],
      );



    })),






                )




      ]),
    );
  }
}



