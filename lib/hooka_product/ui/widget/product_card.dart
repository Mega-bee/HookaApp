import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/hooka_product/product_routes.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../response/getproduct_response.dart';

class ProductCard extends StatefulWidget {
  final GetAllProductResponse getAllProductResponse;

  ProductCard(this.getAllProductResponse);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductsRoutes.ProductDetails,
            arguments: widget.getAllProductResponse.id.toString());
      },
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.8, color: Colors.black),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.getAllProductResponse.image.toString(),
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.18,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
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
            SizedBox(
              height: 5,
            ),

            Center(
                child: Text(
              widget.getAllProductResponse.title.toString(),
              style: GoogleFonts.anekLatin(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            )),

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
    );
  }
}
