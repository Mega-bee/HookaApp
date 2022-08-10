import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooka/hooka_product/product_routes.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../response/getproduct_response.dart';

class ProductCard extends StatefulWidget {
 final  GetAllProductResponse getAllProductResponse;
 ProductCard(this.getAllProductResponse);
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return

      InkWell(
        onTap: (){Navigator.pushNamed(context, ProductsRoutes.ProductDetails,arguments:widget.getAllProductResponse.id.toString() );

        },
        child: Container(

          height: 100,
          width: 100,
          child: Center(
            child: Column(children: [
              CachedNetworkImage(
                imageUrl:widget.getAllProductResponse.image.toString(),height: 70,fit: BoxFit.cover,
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
              SizedBox(height: 8,),
              Text(widget.getAllProductResponse.title.toString())


            ],),
          ),

        ),
      );
  }
}
