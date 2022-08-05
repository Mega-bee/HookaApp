import 'package:flutter/material.dart';

import '../../../hooka_places/ui/screen/places_details.dart';
import '../../../utils/style/colors.dart';
import '../../model/sent_model.dart';
import '../../model/sent_model.dart';

class SentCard extends StatefulWidget {

  final SentModel? sentModel;
  SentCard({
    this.sentModel
  });
  @override
  State<SentCard> createState() => _SentCardState();
}

class _SentCardState extends State<SentCard> {
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
                  width: 100,
                  height: 150,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Stack(
                      children:[

                        Center(
                          child: Card(elevation:10,
                            shadowColor: Colors.red[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),)),

                            child: Image.asset(widget.sentModel!.image.toString(),
                              width: 100, height: 100, fit: BoxFit.cover,),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50,bottom: 20,top: 100),
                          child: Container(
                            height: 200,
                            width: 200,
                            color: Colors.transparent,
                            child: Card(color: Colors.green,child: Center(child: Text(widget.sentModel!.rate.toString(),
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

              Flexible(

                  child:
                  Column(
                      children: [ Text(widget.sentModel!.title.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Container(
                          height: 20,width: 70,
                          child: Center(
                            child: Text(widget.sentModel!.buddies.toString(),
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),


                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                        InkWell(
                          // onTap: (){Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const PlacesDetails()),
                          // );
                      // },
                          child: Container(height: 30,width: 120,
                            color: YellowColor,
                            child: Center(
                              child: Text("View Details",
                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
                            ),
                          ),
                        ),
                      ])
              ),

            ]),),

      Divider(color: Colors.grey, thickness: 0),

    ],
    );
  }
}
