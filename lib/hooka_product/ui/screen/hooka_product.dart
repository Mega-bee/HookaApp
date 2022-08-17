import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../Hooka Basket/basket_routes.dart';
import '../../../abstracts/states/state.dart';
import '../../../home_page/ui/widget/menu_widget.dart';
import 'package:hooka/utils/images/images.dart';

import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../state_manager/getproduct_state_manager.dart';


@injectable
class HookaProduct extends StatefulWidget {
 final GetProductCubit cubit;
 HookaProduct(this.cubit);

  @override
  State<HookaProduct> createState() => HookaProductState();
}

class HookaProductState extends State<HookaProduct> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getProduct(this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Hooka Products",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        actions: [IconButton(onPressed: (){

        }, icon: Icon(Icons.notifications,color: Colors.black,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, BasketRoutes.BasketS);
          }, icon: Icon(Icons.shopping_cart,color: Colors.black,)),
        ],
      ),
      body: BlocBuilder<GetProductCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ));}





}
