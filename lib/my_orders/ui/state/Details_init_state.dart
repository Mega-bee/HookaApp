
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../response/details_order_response.dart';
import '../Screen/order_details.dart';


class OrderDetailsInitState extends States {
  final DetailsResponse detailsSentResponse;
  final OrderDetailsState sentDetailsState;
  OrderDetailsInitState(this.detailsSentResponse,this.sentDetailsState);
  @override
  Widget getUI(BuildContext context) {
return SingleChildScrollView(
  child:   Container(
    height: 900,
    child:   Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [


  
        SizedBox(height: 5,),

        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Container(
            height: 180,
            child: Center(
              child: Card(
                  elevation: 2,


                  shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        width: 1,
                        color: Colors.black26,)
                  ),
                  child:
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(

                            title:  Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Order",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500 ),),
                                    SizedBox(width: 5,),
                                    Icon(Icons.insert_drive_file_outlined,size: 12,)
                                  ],
                                ),
                                Divider(height: 20,color: Colors.black26,),
                                SizedBox(height: 5,),
                              ],
                            ),

                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height:30,width: 130,
                                        child: Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(
                                              width: 0,
                                              color: Colors.black26,),),
                                          child: Center(
                                            child: Text("Id : ${detailsSentResponse.id}"

                                              ,style: TextStyle(
                                                  fontSize: 11,fontWeight: FontWeight.w500
                                              ),),
                                          ),
                                        ),
                                      ),  Container(
                                        height:30,width: 130,
                                        child: Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(
                                              width: 0,
                                              color: Colors.black26,),),
                                          child: Center(
                                            child: Text("Status : ${detailsSentResponse.status}"

                                              ,style: TextStyle(
                                                  fontSize: 11,fontWeight: FontWeight.w500
                                              ),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height:30,width: 130,
                                        child: Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(
                                              width: 0,
                                              color: Colors.black26,),),
                                          child: Center(
                                            child: Text("Total Price : ${detailsSentResponse.total} \$"

                                              ,style: TextStyle(
                                                  fontSize: 11,fontWeight: FontWeight.w500
                                              ),),
                                          ),
                                        ),
                                      ),  Container(
                                        height:30,width: 130,
                                        child: Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(
                                              width: 0,
                                              color: Colors.black26,),),
                                          child: Center(
                                            child: Text("Date : ${detailsSentResponse.date!.split("T").first}"

                                              ,style: TextStyle(
                                                  fontSize: 9,fontWeight: FontWeight.w600
                                              ),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
SizedBox(height: 25,),
                                ],
                              ),
                            ),
                          ),

                          // Row(
                          //   children: [
                          //     Container(child: Card(child: Icon(Icons.check,color: Colors.yellow,)),),
                          //     Column(
                          //       children: [
                          //         Text("Design Native Task Management ",style: TextStyle(color: Colors.black),),
                          //         Text("(New feature in Workiom) Similar ",style: TextStyle(color: Colors.black),),
                          //         Text("to Asana, Clickup                         ",style: TextStyle(color: Colors.black),),
                          //       ],
                          //     ),
                          //   ],
                          // ),



                        ],
                      ),
                    ),
                  )
              ),
            ),
          ),
        ),
        SizedBox(height: 1,),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Container(
            height: 180,
            child: Center(
              child: Card(
                elevation: 2,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        width: 0,
                        color: Colors.black26,)
                  ),
                  child:
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(

                            title:  Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500 ),),
                                    SizedBox(width: 5,),
                                    Icon(Icons.location_on_outlined,size: 12,)
                                  ],
                                ),
                                Divider(height: 20,color: Colors.black26,),
                                SizedBox(height: 5,),
                              ],
                            ),

                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height:30,width: 130,
                                        child: Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(
                                              width:0,
                                              color: Colors.black26,),),
                                          child: Center(
                                            child: Text("Name : ${detailsSentResponse.address!.title}"

                                              ,style: TextStyle(
                                                  fontSize: 11,fontWeight: FontWeight.w500
                                              ),),
                                          ),
                                        ),
                                      ),  Container(
                                        height:30,width: 130,
                                        child: Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(
                                              width: 0,
                                              color: Colors.black26,),),
                                          child: Center(
                                            child: Text("City : ${detailsSentResponse.address!.city}"

                                              ,style: TextStyle(
                                                  fontSize: 11,fontWeight: FontWeight.w500
                                              ),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height:30,width: 130,
                                        child: Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(
                                              width: 0,
                                              color: Colors.black26,),),
                                          child: Center(
                                            child: Text("Street : ${detailsSentResponse.address!.street}"

                                              ,style: TextStyle(
                                                  fontSize: 11,fontWeight: FontWeight.w500
                                              ),),
                                          ),
                                        ),
                                      ),  Container(
                                        height:30,width: 130,
                                        child: Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(
                                              width: 0,
                                              color: Colors.black26,),),
                                          child: Center(
                                            child: Text("Building : ${detailsSentResponse.address!.building}"

                                              ,style: TextStyle(
                                                  fontSize:11,fontWeight: FontWeight.w500
                                              ),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:30,width: 130,
                                        child: Card(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),

                                            side: BorderSide(
                                              width: 0,
                                              color: Colors.black26,),),
                                          child: Center(
                                            child: Text("Appartment : ${detailsSentResponse.address!.appartment}"

                                              ,style: TextStyle(
                                                  fontSize: 11,fontWeight: FontWeight.w500
                                              ),),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Row(
                          //   children: [
                          //     Container(child: Card(child: Icon(Icons.check,color: Colors.yellow,)),),
                          //     Column(
                          //       children: [
                          //         Text("Design Native Task Management ",style: TextStyle(color: Colors.black),),
                          //         Text("(New feature in Workiom) Similar ",style: TextStyle(color: Colors.black),),
                          //         Text("to Asana, Clickup                         ",style: TextStyle(color: Colors.black),),
                          //       ],
                          //     ),
                          //   ],
                          // ),



                        ],
                      ),
                    ),
                  )
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Divider(height: 5,color: Colors.black26,indent: 30,endIndent: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Items",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                SizedBox(width: 5,),
                Icon(Icons.shopping_bag_outlined,size: 12,color: Colors.grey,)


          ]),
        ),
        Divider(height: 5,color: Colors.black26,indent: 30,endIndent: 30),
        SizedBox(height: 5,),
        Expanded(
          child:
          ListView.builder(

              physics: NeverScrollableScrollPhysics(),
              itemCount:detailsSentResponse.items!.length ,

              itemBuilder: (context, index) {
                final mod = detailsSentResponse.items![index];

                return
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                        child: Card(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                width: 1,
                color: Colors.black26,),),
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl:mod.productImage.toString(),
                              height: 40,width: 50,
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
                              placeholder: (context, url) => const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballBeat,
                                  colors: [Colors.black],
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            title: Row(
                              children: [
                                Text("${mod.productName} "),
                                Text("(${mod.productPrice}\$/Per Item)",style: TextStyle(fontSize: 10,color: Colors.grey),),
                              ],
                            ),
                            subtitle: Text("Qunatity : ${mod.quantity}"),
                            trailing: Text("Price : ${mod.totalPrice} \$"),


                          ),
                        ),
                      ),



                    ],);
              }),

        ),


  




        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
  
    ]),
  ),
);
  }

}