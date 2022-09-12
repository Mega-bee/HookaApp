import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/offers/offers_routes.dart';
import 'package:neon/neon.dart';
import '../../response/offers_response.dart';
class OffersCard extends StatefulWidget {

  final OffersResponse offersResp;
  OffersCard(this.offersResp);

  @override
  State<OffersCard> createState() => _OffersCardState();
}

class _OffersCardState extends State<OffersCard> {
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 190,

        child:
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap:() {
              Navigator.pushNamed(context, OffersRoutes.OffersDetails,
                  arguments: widget.offersResp.id.toString());
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    Stack(
                      children:[ ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),

                        child: Image.asset("assets/images/restaurant-939435_960_720-768x512.jpeg",fit: BoxFit.contain,

                        ),
                      ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(250, 216, 1,0.6),
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(35),bottomRight: Radius.circular(5),

                            )),
                         width:120,
                            child: Column(children: [

                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.offersResp.title.toString(),style: GoogleFonts.rubik(color: Colors.white,fontWeight: FontWeight.bold),),

                                ],
                              ),





                            ],),
                          ),
                        ),
                    ]),

                    ListTile(title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.offersResp.restaurantTitle.toString(),style: GoogleFonts.alef(
                          fontWeight: FontWeight.bold,fontSize: 14
                        ),),


                        Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),

                              color:
                              widget.offersResp.rating! <= 2?
                              Colors.red:
                              widget.offersResp.rating! <= 4?
                              Colors.orange:Colors.green[700],),
                            width: 30,height: 18,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(widget.offersResp.rating.toString(),style: GoogleFonts.anekLatin(

                                    color: Colors.white,fontSize: 12),),
                                Icon(Icons.star,size: 9,color: Colors.white,)
                              ],
                            )),

                      ],
                    ),





                      // width: 140, height: 140, fit: BoxFit.cover,
                    ),



                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
