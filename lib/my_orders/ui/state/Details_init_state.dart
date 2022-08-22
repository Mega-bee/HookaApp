
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
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Text("Order",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ),
        ListTile(
          leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),
                color: YellowColor,
              ),
              child: Center(child: Text(detailsSentResponse.id.toString()))),
          title:Text(detailsSentResponse.status.toString()) ,
          subtitle: Text("Total Price : ${detailsSentResponse.total}",),
          trailing: Text(detailsSentResponse.date.toString()),
        ),
  
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Text("Items",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ),
        Expanded(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount:detailsSentResponse.items!.length ,
  
              itemBuilder: (context, index) {
                final mod = detailsSentResponse.items![index];
  
                return
                  Column(
                    children: [
                      ListTile(
                        leading: CachedNetworkImage(
                          imageUrl:mod.productImage.toString(),
                          height: 30,width: 30,
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
                        title: Text(mod.productName.toString()),
                        subtitle: Text("Qunatity : ${mod.quantity}"),
                        trailing: Text("Price : ${mod.productPrice}"),
  
  
                      ),
                      SizedBox(  height: MediaQuery.of(context).size.height * 0.02,),
                      Container(
                          decoration: BoxDecoration(

                border: Border.all(
                width: 1.0,

                color: Colors.black,)
                          ),height:20,width:170,
                          child: Center(child: Text("Total Price: ${mod.totalPrice}",style: TextStyle(fontWeight: FontWeight.w600,fontStyle: FontStyle.italic)))),
  
                    ],);
              }),
        ),
  
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Text("Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Name  :",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: Colors.grey)),
              Text("${detailsSentResponse.address!.title}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
  
  
            ],
  
          ),
        ),
  
        SizedBox(    height: MediaQuery.of(context).size.height * 0.01,),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("City  :",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: Colors.grey)),
              Text("${detailsSentResponse.address!.city}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
  
  
            ],
  
          ),
        ),
        SizedBox(    height: MediaQuery.of(context).size.height * 0.01,),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Street  :",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: Colors.grey)),
              Container(
               height: 20,width: 40,
                child: Center(
                  child: Text("${detailsSentResponse.address!.street}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black)),
                ),
              ),
  
  
            ],
  
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Building  :",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: Colors.grey)),
              Container(
                height: 20,width: 40,
                child: Center(
                  child: Text("${detailsSentResponse.address!.building}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black)),
                ),
              ),
  
  
            ],
  
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Appartment  :",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: Colors.grey)),
              Container(
                height: 20,width: 40,
                child: Center(
                  child: Text("${detailsSentResponse.address!.appartment}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black)),
                ),
              ),
  
  
            ],
  
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
  
    ]),
  ),
);
  }

}