import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../utils/style/colors.dart';

import '../model/places_card_model.dart';
import '../screen/places_details.dart';

class PlacesCard extends StatefulWidget {
  final PlaceModel ? modelp;
  PlacesCard({this.modelp});




  @override
  State<PlacesCard> createState() => _PlacesCardState();
}

class _PlacesCardState extends State<PlacesCard> {
  @override
  Widget build(BuildContext context) {
    return  Column(children: <Widget>[

      GestureDetector(
        onTap: () =>
        {
        },
        child: Row(
            children: [
              Container(
                  width: 140,
                  height: 170,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Stack(
                    children:[

                      Center(
                        child: Card(elevation:10,
    shadowColor: Colors.red[100],
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(12),)),

                          child: Image.asset(widget.modelp!.image.toString(),
                            width: 140, height: 140, fit: BoxFit.cover,),
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50,bottom: 5,top: 130),
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.transparent,
                          child: Card(color: Colors.green,child: Center(child: Text(widget.modelp!.rate.toString(),
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),)),
elevation: 2,shadowColor: YellowColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(1),
                                bottomRight:  Radius.circular(10),
                                bottomLeft: Radius.circular(1),
                              ),
                            ),
                          ),
                        ),
                      ),

                  ])),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: [ Text(widget.modelp!.title.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      Container(
                        height: 20,width: 120,color: Colors.red[50],
                        child: Center(
                          child: Text(widget.modelp!.foodType.toString(),
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                        Icon(FontAwesomeIcons.car),
                        SizedBox(width: MediaQuery.of(context).size.width*0.08,),
                        Text(widget.modelp!.location.toString(),
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
                      ]),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                      InkWell(
                        onTap: (){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PlacesDetails()),
                        );},
                        child: Container(height: 30,width: 120,
                          color: YellowColor,
                          child: Center(
                            child: Text("View Details",
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
                          ),
                        ),
                      ),
                    ]),
              ),

            ]),),

      Divider(color: Colors.grey, thickness: 0),

    ],
    );
  }
}
