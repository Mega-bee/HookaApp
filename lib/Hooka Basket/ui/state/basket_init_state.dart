import 'package:flutter/material.dart';
import 'package:hooka/Hooka%20Basket/request/update_basket_request.dart';
import '../../../abstracts/states/state.dart';
import '../../../checkout/checkout_routes.dart';
import '../../../utils/style/colors.dart';
import '../../request/item_delete_request.dart';
import '../../response/basket_response.dart';
import '../screen/basket_screen.dart';
import '../widget/basket_card.dart';

class BasketInitState extends States {
  final BasketResponse _basketResponse;
  final BasketScreenState screenState;
  BasketInitState(
    this._basketResponse,
    this.screenState,
  ) : super() {
    totalPriceAllItem = _basketResponse.totalPrice ?? 0;
  }

  num totalPriceAllItem = 0;

  @override
  Widget getUI(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: _basketResponse.items!.length,
              itemBuilder: (context, index) {
                return BasketCard(_basketResponse.items![index],
                    onQuantityChange: () {
                  totalPriceAllItem = 0;
                  _basketResponse.items?.forEach((element) {
                    totalPriceAllItem =
                        totalPriceAllItem + element.totalLocalPrice;
                  });
                  screenState.refresh();
                }, OnDelete: () {
                  _basketResponse.items!.removeAt(index);
                  totalPriceAllItem = 0;
                  _basketResponse.items?.forEach((element) {
                    totalPriceAllItem =
                        totalPriceAllItem + element.totalLocalPrice;
                  });
                  screenState.DeleteItemFromCart(DeleteItemCarttRequest(
                      productId:
                          _basketResponse.items![index].itemId.toString()));
                  screenState.refresh();
                });
              }),
        ),
        Container(
          height: 2,
          width: 400,
          color: Colors.black87,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Spacer(
            flex: 3,
          ),
          Container(
            height: 35,
            width: 180,
            child: Center(
              child: Text(
                "Total :           \$ ${totalPriceAllItem}",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
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
//              InkWell(
//                onTap: () {
//                  screenState.UpdateCartttt(UpdateCartRequest(
//                    id: _basketResponse.items!.toString(),
//                    quantity: NewQunatity.toString(),
//                  ));
//                },
//                child: Container(
//                    width: 100,
//                    height: 50,
//                    child: Card(
//                        color: YellowColor,
//                        elevation: 8,
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(40.0),
//                        ),
//                        child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Center(
//                                child: Text(
//                              "Update",
//                              style: TextStyle(
//                                  color: Colors.black87,
//                                  fontSize: 12,
//                                  fontWeight: FontWeight.bold),
//                            ))))),
//              ),
              InkWell(
                onTap: () {
                  List<UpdateCartRequest> itemsUpdated = [];
                  _basketResponse.items?.forEach((element) {
                    itemsUpdated.add(UpdateCartRequest(
                        id: element.itemId ?? -1,
                        quantity: element.quantity ?? 0));
                  });

                  screenState.updateCartAndCheckOut(
                      UpdateListCartRequest(items: itemsUpdated));
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
                              style: TextStyle(
                                  color: YellowColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ))))),
              ),
            ],
          ),
        )
      ],
    );
  }
}
