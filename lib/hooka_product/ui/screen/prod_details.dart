import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../hooka_places/state_manager/details_state_manager.dart';
import '../../../utils/style/colors.dart';
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
   int? productId;
  int? Qunatity;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  bool flags = true;

  AddToCarttttt(String p,String q){
    widget.cubit.AddToCart(this,"$p","$q");
  }

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
        appBar: AppBar(
          elevation: 0,
          title: Text("Details",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
            onPressed: (){Navigator.of(context).pop();},
          ),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.black,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.black,)),
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
