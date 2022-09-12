import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child:
        SizedBox(
          height: 190,

          child:
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              color: Color.fromRGBO(230, 230, 230, 0.6),
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

                          child:

                          CachedNetworkImage(
                            imageUrl: widget.getAllProductResponse.image.toString(),
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
                    SizedBox(height: 15,),
                    Center(child: Text(widget.getAllProductResponse.title.toString(),style: GoogleFonts.rubik(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),



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
