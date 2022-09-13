import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../response/detailsprod_response.dart';

class DetailsProdCard extends StatefulWidget {
  final  DetailsProductResponse detailsProductResponse;
  final Function ontap;
  int count;
  int index;
  DetailsProdCard(this.detailsProductResponse,this.ontap,this.count,this.index);

  @override
  State<DetailsProdCard> createState() => _DetailsProdCardState();
}

class _DetailsProdCardState extends State<DetailsProdCard> {
  bool _value = false;
  late bool valu;
  int selectedCard = -1;

  @override
  Widget build(BuildContext context) {

    return InkWell(


      splashColor:  Colors.white,

      highlightColor: Colors.white,

      onTap: (){
// selectedCard=widget.index;
        widget.detailsProductResponse.isselected = !widget.detailsProductResponse.isselected!;

        setState(() {

        });
        widget.ontap();
      },
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Center(
            child: ClipRRect(

              borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),

              child:

              CachedNetworkImage(
                imageUrl: widget.detailsProductResponse.image.toString(),
                fit: BoxFit.cover,
                height: 300,width: 250,

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
          ),

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
          SizedBox(height: 10,),
          Container(
              width: 300,height: 60,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Text("${widget.index} / ${widget.count}"),
                  Icon(Icons.arrow_forward_rounded,color: Colors.grey,)
                ],
              ))



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
    );
  }
}
