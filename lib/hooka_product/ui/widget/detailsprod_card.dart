import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooka/utils/style/colors.dart';
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
    return Container(
      width: 100,

      child: InkWell(
        onTap: (){

          widget.detailsProductResponse.isselected = !widget.detailsProductResponse.isselected!;

          setState(() {

          });
          widget.ontap();
        },
        child: Card(

          color:
          widget.detailsProductResponse.isselected==true?
            YellowColor:
          Colors.white,


          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl:widget.detailsProductResponse.image.toString(),height: 50,fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>const Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: LoadingIndicator(

                      indicatorType:
                      Indicator.ballBeat,


                      colors: [Colors.black],
                    ),),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 10,),
                Center(child: Text(widget.detailsProductResponse.title.toString())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
