import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooka/Hooka%20Basket/model/basket.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../response/basket_response.dart';

class BasketCard extends StatefulWidget {

  final Items _items;
  var  total;


  BasketCard(this._items,this.total);



// @override
//   void initState() {
//   var increment =  _items.quantity ??0 ;
//   var total = _items.quantity!  * _items.productPrice! ;
//
//   }

  @override
  State<BasketCard> createState() => _BasketCardState();
}

class _BasketCardState extends State<BasketCard> {


  @override

  Widget build(BuildContext context) {
    var increment =  widget._items.quantity ??0 ;
    var total = widget._items.quantity!  * widget._items.productPrice! ;
    // var icp=(widget.basketm.increment * widget.basketm.incprice);
    return Container(

      width: 200,
      height: 100,
      child: Card(
            elevation: 8,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              imageUrl:   widget._items.productImage.toString(),
              width:50 ,
              fit: BoxFit.cover,
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
                  indicatorType: Indicator.ballBeat,
                  colors: [Colors.black],
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

            Container(
              width: 40,
              height: 40,
              child: InkWell(
                onTap: () {

                  if(increment > 0){
                    increment--;
                    setState(() {

                    });
                  }
                //   if (widget.basketm.increment > 0){
                //     widget.basketm.increment --;
                //   widget.basketm.bcp =widget.basketm.increment * widget.basketm.incprice;
                //
                //
                //
                //   setState(() {
                //
                //   });
                //   widget.total();
                // }
                //   else{
                //     widget.basketm.increment  = 0;}
                //
                //   Order().setOrder(
                //       widget.basketm.id.toString(),
                //       widget.total(),
                //       widget.basketm.image.toString(),
                //       widget.basketm.bcp.toInt()
                //   );
                },
                child:
                Card(
                    color: YellowColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(fontWeight: FontWeight.bold,),
                        ))),
              ),
            ),
            Text(increment.toString(),
              // "${widget.basketm.increment }",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: 40,
              height: 40,
              child: InkWell(
                onTap: () {

                    increment=increment +1;
                    setState(() {

                    });


                   //  widget.basketm.increment ++;
                   //
                   //  widget.basketm.bcp =widget.basketm.increment * widget.basketm.incprice;
                   //  setState(() {
                   //  });
                   // widget.total();

                },
                child: Card(
                    color: YellowColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Center(child: Text("+"))),
              ),
            ),
            Text("USD ${widget._items.productPrice} ",
                style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
