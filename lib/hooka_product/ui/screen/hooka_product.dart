import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import '../../../Hooka Basket/basket_routes.dart';
import '../../../abstracts/states/state.dart';
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
        title: Text("Hooka Products",style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back,color: Primarycolor,size: 25,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, BasketRoutes.BasketS).then((value) {
              setState(() {
              });
            });
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
