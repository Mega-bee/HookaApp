import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../response/detailsprod_response.dart';

class DetailsProdCard extends StatefulWidget {
  final  DetailsProductResponse detailsProductResponse;
  final Function ontap;
  DetailsProdCard(this.detailsProductResponse,this.ontap);

  @override
  State<DetailsProdCard> createState() => _DetailsProdCardState();
}

class _DetailsProdCardState extends State<DetailsProdCard> {
  bool _value = false;
  late bool valu;

  @override
  Widget build(BuildContext context) {
    return InkWell(


      splashColor:  Colors.white,

      highlightColor: Colors.white,

      onTap: (){

        widget.detailsProductResponse.isselected = !widget.detailsProductResponse.isselected!;

        setState(() {

        });
        widget.ontap();
      },
      child:
      SizedBox(
        height: 190,

        child:
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(

           elevation: 0,
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  Stack(
                      children:[ ClipRRect(

                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),

                        child:

                        CachedNetworkImage(
                          imageUrl: widget.detailsProductResponse.image.toString(),
                          fit: BoxFit.cover,
                          height: 180,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(

                                bottomRight: Radius.circular(40),
                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballBeat,
                              colors: [Colors.black],
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),

                      ]),
                  SizedBox(height: 21,),
                  Container(
                      decoration: BoxDecoration(

                          color:
                              widget.detailsProductResponse.isselected==true?
                          Colors.grey[200]:Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),bottomRight: Radius.circular(5),

                          )),


                      height: 50,
                      child: Center(child: Text(widget.detailsProductResponse.title.toString(),style: GoogleFonts.rubik(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),))),



                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: Color.fromRGBO(250, 216, 1,0.6),
                  //       borderRadius: BorderRadius.only(
                  //         topRight: Radius.circular(5),bottomRight: Radius.circular(65),
                  //         bottomLeft: Radius.circular(35),topLeft: Radius.circular(5),
                  //
                  //       )),
                  //   width:50,
                  //   child:
                  //
                  // ),










                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
