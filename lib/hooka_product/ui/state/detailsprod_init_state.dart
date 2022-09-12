import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/utils/style/colors.dart';
import '../../../abstracts/states/state.dart';
import '../../response/detailsprod_response.dart';
import '../screen/prod_details.dart';
import '../widget/detailsprod_card.dart';

class DetailsProdInitState extends States {
  final List<DetailsProductResponse> detailsprodresp;

  final DetailsProductState detailsProductState;
  DetailsProdInitState(
    this.detailsprodresp,
    this.detailsProductState,
  ) : super() {
    detailsprodresp.first.isselected = true;
    isselec = detailsprodresp.first;
  }

  num Total1 = 0;
  num inc = 1;

  DetailsProductResponse? isselec;

  @override
  Widget getUI(BuildContext context) {

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.77,

          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0,bottom: 5,top: 10),
                        child: Text(
                          "Choose Your flavor",
                          style: GoogleFonts.alef(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                    ),

                    Container(


                      height: MediaQuery.of(context).size.height * 0.57,
                      child: GridView.builder(

                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: (2.5 / 2.5),
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0),
                          itemCount: detailsprodresp.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final PlacesList = detailsprodresp[index];

                            return DetailsProdCard(PlacesList, () {
                              detailsprodresp.forEach((element) {
                                element.isselected = false;

                              });

                              detailsprodresp[index].isselected = true;
                              isselec = PlacesList;
                              inc=1;
                              detailsProductState.refresh();
                            });
                          }),
                    ),
                    Container(
                      width: double.infinity,
    decoration: BoxDecoration(
    border: Border(

    top:  BorderSide(color:

    Colors.black12, width: 0.5,),)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
  width: 150,
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 18,top: 35
                                  ),
                                  child: Text(
                                    "${isselec!.title}",

    style: GoogleFonts.alef(
    fontWeight: FontWeight.w600, fontSize: 25),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 18,top: 35),
                                child: Text(
                                  "\$ ${isselec!.customerInitialPrice}",
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 18,bottom: 8),
                      child: Text(
                        isselec!.description.toString(),
                        style:
                        TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        Container(
          height: 80,
          width:800,

          decoration: BoxDecoration(
         color: YellowColor,
              borderRadius: BorderRadius.circular(65)),


          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Container(
                width: 50,
                height: 40,
                
                child: Card(
color: YellowColor,
                  shape: RoundedRectangleBorder(


                    borderRadius: BorderRadius.circular(55.0),

                    side: BorderSide(
                      color: Colors.black,
                    ),

                    ),
                    child: InkWell(
                    onTap: () {
                      if (inc > 1) {
                        inc--;
                        detailsProductState.refresh();
                      }
                    },
                    child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30),
                        )),
                  ),
                ),
              ),
            SizedBox(width: 20,),
              Text(
                "${inc}",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),
              ),
              SizedBox(width: 20,),
              Container(

                width: 50,
                height: 40,
                child: Card(
                  color: YellowColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55.0),
                    side: BorderSide(
                      color: Colors.black,
                    ),
                  ),
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
                    child: Center(child: Text("+",  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30
    )),

                    )),
                ),
                ),

              Spacer(),


              InkWell(
                onTap: () {
                  if (inc > 0) {
                    Fluttertoast.showToast(
                        msg: "${inc} ${isselec!.title} Added To Cart");

                    detailsProductState.AddToCarttttt(
                        isselec!.id.toString(), inc.toString());
                  } else
                    Fluttertoast.showToast(msg: " Please Add Qunatity ");
                },
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55.0),

                  ),

                  elevation: 5,
                  child: Container(
                    height:40,
                    width: 120,

                    child: Center(
                        child: Text(
                      "Add To Cart",
                      style: GoogleFonts.alef(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
