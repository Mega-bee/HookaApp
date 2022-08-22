import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
   var increment =  widget._items.quantity ??0;
    var total = widget._items.quantity!  * widget._items.productPrice! ;
    // var icp=(widget.basketm.increment * widget.basketm.incprice);
    return Container(


      width: 200,
      height: 110,
      child: Card(
            elevation: 4,
        // color:  Color.fromRGBO(172, 187, 212,1),
            shadowColor: Colors.black87,


            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(10.0),
            ),
        child: Center(
          child:Row(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl:   widget._items.productImage.toString(),
                  width:85 ,
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
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 240,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Align(
                          alignment:Alignment.bottomLeft,

                          child: Text(widget._items.productName.toString(),style: TextStyle(fontSize: 20),)),

                      Align(                          alignment:Alignment.bottomLeft,

                        child: Text("\$ ${widget._items.productPrice} ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Row(

                        children:

                        [

                          Container(
                            width: 30,
                            height: 30,
                            child: InkWell(
                              onTap: () {


                                if(increment > 0){
                                  increment --;
                                  setState(() {

                                  });
                                }

                              },
                              child:
                              Card(
                                color: YellowColor,
                           elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Center(
                                      child: Text(
                                        "-",
                                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                      ))),
                            ),
                          ),
                          Spacer(),
                          Text(increment.toString(),
                            // "${widget.basketm.increment }",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            child: InkWell(
                              onTap: () {

                                increment ++;
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
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Center(child: Text("+",style: TextStyle(color: Colors.black),))),
                            ),
                          ),
                        ],),

                    ],
                  ),
                ),
              )
            ],
          )

          // ListTile(
          //   title: Text(widget._items.productName.toString()),
          //   leading:
          //   CachedNetworkImage(
          //     imageUrl:   widget._items.productImage.toString(),
          //     width:100 ,
          //     height: 70,
          //     fit: BoxFit.cover,
          //     imageBuilder: (context, imageProvider) => Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(80),
          //         image: DecorationImage(
          //           image: imageProvider,
          //           fit: BoxFit.contain,
          //         ),
          //       ),
          //     ),
          //     placeholder: (context, url) => Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: LoadingIndicator(
          //         indicatorType: Indicator.ballBeat,
          //         colors: [Colors.black],
          //       ),
          //     ),
          //     errorWidget: (context, url, error) => Icon(Icons.error),
          //   ),
          //   subtitle:
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children:
          //
          //   [
          //
          //     Container(
          //       width: 25,
          //       height: 25,
          //       child: InkWell(
          //         onTap: () {
          //
          //           if(increment > 0){
          //             increment--;
          //             setState(() {
          //
          //             });
          //           }
          //           //   if (widget.basketm.increment > 0){
          //           //     widget.basketm.increment --;
          //           //   widget.basketm.bcp =widget.basketm.increment * widget.basketm.incprice;
          //           //
          //           //
          //           //
          //           //   setState(() {
          //           //
          //           //   });
          //           //   widget.total();
          //           // }
          //           //   else{
          //           //     widget.basketm.increment  = 0;}
          //           //
          //           //   Order().setOrder(
          //           //       widget.basketm.id.toString(),
          //           //       widget.total(),
          //           //       widget.basketm.image.toString(),
          //           //       widget.basketm.bcp.toInt()
          //           //   );
          //         },
          //         child:
          //         Card(
          //             color: YellowColor,
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(40.0),
          //             ),
          //             child: Center(
          //                 child: Text(
          //                   "-",
          //                   style: TextStyle(fontWeight: FontWeight.bold,),
          //                 ))),
          //       ),
          //     ),
          //     Text(increment.toString(),
          //       // "${widget.basketm.increment }",
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //     Container(
          //       width: 25,
          //       height: 25,
          //       child: InkWell(
          //         onTap: () {
          //
          //           increment=increment +1;
          //           setState(() {
          //
          //           });
          //
          //
          //           //  widget.basketm.increment ++;
          //           //
          //           //  widget.basketm.bcp =widget.basketm.increment * widget.basketm.incprice;
          //           //  setState(() {
          //           //  });
          //           // widget.total();
          //
          //         },
          //         child: Card(
          //             color: YellowColor,
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(40.0),
          //             ),
          //             child: Center(child: Text("+"))),
          //       ),
          //     ),
          //   ],)
          //   ,
          //   trailing:  Text("\$ ${widget._items.productPrice} ",
          //       style: TextStyle(fontWeight: FontWeight.bold)),
          // ),
        )


        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     CachedNetworkImage(
        //       imageUrl:   widget._items.productImage.toString(),
        //       width:50 ,
        //       fit: BoxFit.cover,
        //       imageBuilder: (context, imageProvider) => Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(80),
        //           image: DecorationImage(
        //             image: imageProvider,
        //             fit: BoxFit.contain,
        //           ),
        //         ),
        //       ),
        //       placeholder: (context, url) => Padding(
        //         padding: const EdgeInsets.all(15.0),
        //         child: LoadingIndicator(
        //           indicatorType: Indicator.ballBeat,
        //           colors: [Colors.black],
        //         ),
        //       ),
        //       errorWidget: (context, url, error) => Icon(Icons.error),
        //     ),
        //
        //     Container(
        //       width: 40,
        //       height: 40,
        //       child: InkWell(
        //         onTap: () {
        //
        //           if(increment > 0){
        //             increment--;
        //             setState(() {
        //
        //             });
        //           }
        //         //   if (widget.basketm.increment > 0){
        //         //     widget.basketm.increment --;
        //         //   widget.basketm.bcp =widget.basketm.increment * widget.basketm.incprice;
        //         //
        //         //
        //         //
        //         //   setState(() {
        //         //
        //         //   });
        //         //   widget.total();
        //         // }
        //         //   else{
        //         //     widget.basketm.increment  = 0;}
        //         //
        //         //   Order().setOrder(
        //         //       widget.basketm.id.toString(),
        //         //       widget.total(),
        //         //       widget.basketm.image.toString(),
        //         //       widget.basketm.bcp.toInt()
        //         //   );
        //         },
        //         child:
        //         Card(
        //             color: YellowColor,
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(40.0),
        //             ),
        //             child: Center(
        //                 child: Text(
        //                   "-",
        //                   style: TextStyle(fontWeight: FontWeight.bold,),
        //                 ))),
        //       ),
        //     ),
        //     Text(increment.toString(),
        //       // "${widget.basketm.increment }",
        //       style: TextStyle(fontWeight: FontWeight.bold),
        //     ),
        //     Container(
        //       width: 40,
        //       height: 40,
        //       child: InkWell(
        //         onTap: () {
        //
        //             increment=increment +1;
        //             setState(() {
        //
        //             });
        //
        //
        //            //  widget.basketm.increment ++;
        //            //
        //            //  widget.basketm.bcp =widget.basketm.increment * widget.basketm.incprice;
        //            //  setState(() {
        //            //  });
        //            // widget.total();
        //
        //         },
        //         child: Card(
        //             color: YellowColor,
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(40.0),
        //             ),
        //             child: Center(child: Text("+"))),
        //       ),
        //     ),
        //     Text("USD ${widget._items.productPrice} ",
        //         style: TextStyle(fontWeight: FontWeight.bold))
        //   ],
        // ),
      ),
    );
  }
}
