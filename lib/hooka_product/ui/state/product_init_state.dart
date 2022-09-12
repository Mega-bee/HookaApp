import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';
import '../../../utils/images/images.dart';
import '../../response/getproduct_response.dart';
import '../screen/hooka_product.dart';
import '../widget/product_card.dart';

class ProductInitState extends States{
  final List<GetAllProductResponse> getallproducts;
  final HookaProductState hookaProductState;
  ProductInitState(this.getallproducts,this.hookaProductState);

  @override
  Widget getUI(BuildContext context) {
   return SingleChildScrollView(
     child: Column(
         mainAxisAlignment: MainAxisAlignment.center,

         children: [


    Padding(
      padding: const EdgeInsets.all(18.0),
      child: GridView.builder(
      physics:const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (3.5 / 4.5),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5),
      itemCount: getallproducts.length,
      itemBuilder: (context, index) {
        final OffersList = getallproducts[index];
        return ProductCard(OffersList);
      }),
    ),
           SizedBox(height: MediaQuery.of(context).size.height*0.1,),
         ]),
    );
  }

}