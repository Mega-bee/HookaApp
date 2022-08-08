import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooka/offers/offers_routes.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../response/offers_response.dart';
import '../screen/offers_details_screens.dart';

class OffersCard extends StatefulWidget {

  final OffersResponse offersResp;
  OffersCard(this.offersResp);

  @override
  State<OffersCard> createState() => _OffersCardState();
}

class _OffersCardState extends State<OffersCard> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){Navigator.pushNamed(context, OffersRoutes.OffersDetails,arguments:widget.offersResp.id.toString() );

      },
      child: Card(

          color: Colors.black,
          child: Column(children: [
            CachedNetworkImage(
              imageUrl:widget.offersResp.image.toString(),height: 70,fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              placeholder: (context, url) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: LoadingIndicator(

                  indicatorType:
                  Indicator.ballBeat,


                  colors: [Colors.black],
                ),),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.02,),
            Text(widget.offersResp.restaurantTitle.toString(), style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),),
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.015,),

            Text(widget.offersResp.title.toString(), style: TextStyle(
                color: Colors.grey[500], fontStyle: FontStyle.italic),),
          ])


      ),
    );
  }
}
