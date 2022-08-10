import 'package:flutter/material.dart';

import '../../../Hooka Basket/model/basket.dart';
import '../../../abstracts/states/state.dart';
import '../../response/detailsprod_response.dart';
import '../screen/prod_details.dart';
import '../widget/detailsprod_card.dart';

class DetailsProdInitState extends States {
  final List<DetailsProductResponse> detailsprodresp;
  final DetailsProductState detailsProductState;
  DetailsProdInitState(this.detailsprodresp,this.detailsProductState);

  num Total1 =0;
  num inc =0;
  bool selectedList = false;



  @override
  Widget getUI(BuildContext context) {
    return Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.asset("assets/images/Cool-dad.jpg",fit: BoxFit.cover,),



          Container(
            height: 150,

            child: InkWell(
              onTap: (){
                selectedList = !selectedList;
              },
              child: Card(

                child: ListView.builder(
                    itemCount:detailsprodresp.length ,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final PlacesList = detailsprodresp[index];

                      return DetailsProdCard(PlacesList);


                    }),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(detailsprodresp[4].title.toString()),

              Container(
                width: 40,
                height: 40,
                child: InkWell(
                  onTap: () {

                      if (inc > 0){
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
                      color: Colors.grey[200],
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
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Center(child: Text("+"))),
                ),
              ),
              Text("USD ",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text("Prices",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(detailsprodresp[2].customerInitialPrice.toString(),style: TextStyle(color: Colors.black,fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(detailsprodresp[2].description.toString(),style: TextStyle(color: Colors.black,fontSize: 20),),
          ),






        ]);
  }

}