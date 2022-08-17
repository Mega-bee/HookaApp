import 'package:flutter/material.dart';
import 'package:hooka/my_cart/checkout_routes.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../response/basket_response.dart';
import '../screen/basket_screen.dart';
import '../widget/basket_card.dart';

class BasketInitState extends States {
 final BasketResponse _basketResponse;
  final BasketScreenState screenState;
 BasketInitState(this._basketResponse,this.screenState);
  num Total1=0;
  @override
  Widget getUI(BuildContext context) {
    return     Column(
      children: [

        SizedBox(
          height: 5,
        ),
        Expanded(

          child: Container(

            width: MediaQuery.of(context).size.width*0.97,
            height:  MediaQuery.of(context).size.height*0.8,

            child: ListView.builder(
                itemCount:_basketResponse.items!.length,
                itemBuilder: (context, index) {
                  return BasketCard(
                      _basketResponse.items![index],Total1

                  //     basketmodel[index],(){
                  //   Total1=0;
                  //   basketmodel.forEach((basketModel) {
                  //
                  //     Total1+= basketModel.bcp;
                  //
                  //
                  //   });
                  //   setState(() {
                  //
                  //   });
                  // }



                  );



                }),
          ),
        ),
        Container(height: 2,width: 400,color: Colors.black87,),



        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Spacer(flex: 3,),

            Container(
              height: 35,
              width: 180,


              child: Center(
                child: Text(
                  "Total :           \$ ${_basketResponse.totalPrice}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.black87),
                ),
              ),
            ),
            Spacer(flex: 2,),
            Container(

              child: Center(
                  child: Image.asset(
                    "assets/images/92-924113_shopping-cart-icon-e-commerce-removebg-preview.png",
                    fit: BoxFit.contain,
                    height: 40,
                    width: 50,
                  )),
            ),



        ]),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 100,
                  height: 50,
                  child: Card(
                      color: YellowColor,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                "Update",
                                style: TextStyle(color: Colors.black87, fontSize: 12,fontWeight: FontWeight.bold),
                              ))))),

              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, CheckoutRoutes.Checkout_screen);
                },
                child: Container(
                    width: 200,
                    height: 50,
                    child: Card(
                        color: Colors.black87,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(color: YellowColor, fontSize: 12,fontWeight: FontWeight.bold),
                                ))))),
              ),
            ],
          ),
        )
      ],
    );
  }

}

