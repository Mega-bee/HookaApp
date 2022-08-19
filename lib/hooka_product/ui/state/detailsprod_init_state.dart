import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/utils/style/colors.dart';
import '../../../abstracts/states/state.dart';
import '../../response/detailsprod_response.dart';
import '../screen/prod_details.dart';
import '../widget/detailsprod_card.dart';

class DetailsProdInitState extends States {

  final List<DetailsProductResponse> detailsprodresp;

  final DetailsProductState detailsProductState;
  DetailsProdInitState(this.detailsprodresp,this.detailsProductState,):super(
  ){
    detailsprodresp.first.isselected=true;
    final PlacesList = detailsprodresp.first;
    isselec = PlacesList;
  }

  num Total1 =0;
  num inc =1;

   DetailsProductResponse? isselec ;



  @override
  Widget getUI(BuildContext context) {

    return
      Column(
        children: [
          Container(height: MediaQuery.of(context).size.height*0.7,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(


                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Image.asset("assets/images/Cool-dad.jpg",fit: BoxFit.cover,height: MediaQuery.of(context).size.height*0.40,width: double.infinity,),



                    Container(
                      height: MediaQuery.of(context).size.height*0.15,

                      child: ListView.builder(
                          itemCount:detailsprodresp.length ,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final PlacesList = detailsprodresp[index];


                            return DetailsProdCard(PlacesList,
                              (){
                                detailsprodresp.forEach((element) {element.isselected=false;});


                                detailsprodresp[index].isselected=true;
                                isselec = PlacesList;
                                detailsProductState.refresh();


                            }



                            );


                          }),
                    ),
                    Container(
                     width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start ,

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text("Item Price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text("\$ ${isselec!.customerInitialPrice}",style: TextStyle(color: Colors.black,fontSize: 18),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(isselec!.description.toString(),style: TextStyle(color: Colors.black,fontSize: 18),),
                          ),
                        ],),
                    ),











                  ]),
              ),
            ),
          ),

          isselec==null?Container(

          ):
          Container(

            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [

                SizedBox(height: 30,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Text(isselec!.title.toString(),style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),

                    Container(
                      width: 40,
                      height: 40,

                      child: InkWell(
                        onTap: () {

                          if (inc > 1){
                            inc --;
                            detailsProductState.refresh();
                          }},

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

                        child:
                        Card(
                            color:YellowColor,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))),
                      ),
                    ),
                    Text(
                      "${inc}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: InkWell(
                        onTap: () {
                          inc++;
                          detailsProductState.refresh();


                          // basketm.increment ++;
                          //
                          // widget.basketm.bcp =widget.basketm.increment * widget.basketm.incprice;
                          // setState(() {
                          // });
                          // widget.total();

                        },
                        child: Card(
                            color:YellowColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Center(child: Text("+"))),
                      ),
                    ),
                    // Container(
                    //   width: 70,
                    //   child: Text("\$ ${inc*isselec!.customerInitialPrice!}",
                    //       style: TextStyle(fontWeight: FontWeight.bold)),
                    // )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: InkWell(
                    onTap: (){
                      if(inc>0){

                        Fluttertoast.showToast(msg: "${inc} ${isselec!.title} Added To Cart");

                        detailsProductState.AddToCarttttt(
                            isselec!.id.toString(),inc.toString()
                        );

                      }
                      else  Fluttertoast.showToast(msg: " Please Add Qunatity ");

                    },
                    child: Card(
                      color: Colors.black,elevation: 9,
                      child: Container(
                        height: 30,width: 200,
                        child: Center(child: Text("Add To Cart",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: YellowColor),)),
                      ),
                    ),
                  ),

                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      );
  }

}