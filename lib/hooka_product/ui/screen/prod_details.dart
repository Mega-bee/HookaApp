import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/hooka_product/request/add_to_cart_request.dart';
import 'package:injectable/injectable.dart';
import '../../../Hooka Basket/basket_routes.dart';
import '../../../Hooka Basket/request/item_delete_request.dart';
import '../../../abstracts/states/state.dart';
import '../../../hooka_places/state_manager/details_state_manager.dart';
import '../../../utils/style/colors.dart';
import '../../product_routes.dart';
import '../../state_manager/detailsprod_state_manager.dart';
import '../../state_manager/getproduct_state_manager.dart';


@injectable
class DetailsProduct extends StatefulWidget {
  final ProdDetailsCubit cubit;


  DetailsProduct(this.cubit,);

  @override
  State<DetailsProduct> createState() => DetailsProductState();
}

class DetailsProductState extends State<DetailsProduct> {

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  bool flags = true;

  AddToCarttttt(AddToCartRequest request){
    widget.cubit.AddToCart(this,request);
  }
  DeleteItem(DeleteItemCarttRequest request){
    widget.cubit.DeleteItemCart(this,request);
  }



   ScrollController scrollController = new ScrollController();
  int? count;









  @override
  Widget build(BuildContext context) {

    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is String) {
        widget.cubit.getDetailsProd(this,args);

      }
      flags = false;
    }

    return Scaffold(
    backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text("Details",style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back,color: Primarycolor,size: 25,),
            onPressed: (){
              Navigator.pop(context);



              },
          ),
          actions: [


            Padding(
              padding: const EdgeInsets.only(left: 28.0,top: 10,bottom: 10,right: 10),
              child: Container(

             width: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)

                ),
color: Colors.black,

                  border: Border.all(color: Colors.black)



                ),
                child: IconButton(
                    onPressed: (){
                  Navigator.pushNamed(context, BasketRoutes.BasketS);

                }, icon: Icon(Icons.shopping_cart,color: YellowColor,size: 26,)),
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProdDetailsCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        ),

    );}





}
