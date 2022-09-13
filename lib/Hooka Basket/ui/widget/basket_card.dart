import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../response/basket_response.dart';

class BasketCard extends StatefulWidget {
  final Items _items;
  final Function OnDelete;
  final Function onQuantityChange;

  BasketCard(this._items,
      {required this.OnDelete, required this.onQuantityChange});

  @override
  State<BasketCard> createState() => _BasketCardState();
}

class _BasketCardState extends State<BasketCard> {
  late num itemLocalPrice;

  @override
  void initState() {
    super.initState();

    itemLocalPrice = widget._items.totalPrice ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8),
      child: Container(

 height: 120,


        child: Card(

            elevation: 2,
            // color:  Color.fromRGBO(172, 187, 212,1),
            shadowColor: Color.fromRGBO(172, 187, 212,0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:


            ListTile(
              leading:  CachedNetworkImage(
                imageUrl: widget._items.productImage.toString(),
                width: 90,
                height: 100,
                fit: BoxFit.contain,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballBeat,
                    colors: [Colors.black],
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

              title:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget._items.productName.toString(),
                    style: GoogleFonts.alef(fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                  IconButton(

                      onPressed: () {
                        widget.OnDelete();
                      },
                      icon: Icon(

                        CupertinoIcons.xmark,
                        size: 11,

                      )),
                ],
              ),
horizontalTitleGap: 10,
              isThreeLine: true,
              iconColor: Colors.black,


              subtitle: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text("\$ ${widget._items.productPrice} ",
                        style:  GoogleFonts.anekLatin(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black)),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: InkWell(
                        splashColor: Colors.white,
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        onTap: () {
                          if (widget._items.quantity! > 1) {

                            widget._items.quantity   = widget._items.quantity! - 1;
                            widget._items.totalLocalPrice = widget._items.quantity! * widget._items.productPrice!;
                            widget.onQuantityChange();
                            setState(() {});
                          }

                        },
                        child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: YellowColor),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.black),textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget._items.quantity.toString(),
                      // "${widget.basketm.increment }",
                      style: GoogleFonts.anekLatin(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                      width: 40,
                      height: 40,
                      child: InkWell(
                        splashColor: Colors.white,
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        onTap: () {
                          widget._items.quantity = widget._items.quantity! + 1;
                          widget._items.totalLocalPrice = widget._items.quantity! * widget._items.productPrice!;
                          widget.onQuantityChange();
                          setState(() {});
                        },
                        child: Card(

                            color: YellowColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "+",
                              style: TextStyle(color: Colors.black,fontSize: 27,),textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),

                  ]) ,
            ),



            ),
      ),
    );
  }
}
