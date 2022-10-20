import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/hooka_product/request/add_to_cart_request.dart';
import 'package:hooka/utils/style/colors.dart';
import '../../../Hooka Basket/basket_routes.dart';
import '../../../Hooka Basket/request/item_delete_request.dart';
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
    // detailsprodresp.first.isselected = true;
    // isselec = detailsprodresp.first;
  }

  num Total1 = 0;

  DetailsProductResponse? isselec;

  String? desc;

  @override
  Widget getUI(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 5, top: 10),
              child: Text(
                "Choose Your flavor",
                style:
                    GoogleFonts.alef(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.72,
            width: 400,
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (4.5 / 4.5),
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                itemCount: detailsprodresp.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final PlacesList = detailsprodresp[index];

                  return DetailsProdCard(
                      get: () {
                        detailsProductState.refresh();
                      },
                      delete: (int id) {
                        print(id);
                        print("sex");
                        detailsProductState.DeleteItem(
                            DeleteItemCarttRequest(productId:id ));
                        print(id);
                        detailsprodresp[index].quantityInCart=0;
                      },
                      detailsProductResponse: PlacesList,
                      ontap: () {
                        detailsprodresp.forEach((element) {
                          element.isselected = false;
                        });

                        detailsprodresp[index].isselected = true;
                        isselec = PlacesList;
                        PlacesList.description == desc;
                        detailsProductState.refresh();
                      },
                      onselect: () {
                        detailsprodresp.forEach((element) {
                          element.isselected = false;
                        });

                        detailsprodresp[index].isselected = false;
                        isselec = PlacesList;
                        PlacesList.description == desc;
                        detailsProductState.refresh();
                      },
                      addtocart: (int id, int num) {
                        detailsProductState.AddToCarttttt(
                            AddToCartRequest(itemId: id, quantity: num));
                        print('newwwwwwwwwwwwwww');
                        print(id);
                        print(num);
                        print('newwwwwwwwwwwwwww');
                      });
                }),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, BasketRoutes.BasketS);
            },
              child: Container(
            color: YellowColor,
            height: MediaQuery.of(context).size.height*0.08,
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Go to Cart",                style:
                    GoogleFonts.alef(fontWeight: FontWeight.w600, fontSize: 20),),
                  ),
                ),
          ))
        ]),
      ),
    );
  }
}
