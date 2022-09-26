import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../state_manager/all_order_state_manager.dart';
import '../../state_manager/details_order_state_manager.dart';

@injectable
class OrderDetails extends StatefulWidget {
  final DetailsOrderCubit cubit;
  OrderDetails(this.cubit);

  @override
  State<OrderDetails> createState() => OrderDetailsState();
}

class OrderDetailsState extends State<OrderDetails> with AutomaticKeepAliveClientMixin {



  bool flags = true;


  @override
  Widget build(BuildContext context) {
    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is String) {
        widget.cubit.getOrderDetails(this,args);
      }
      flags = false;
    }
    return
      Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
        icon: Icon(CupertinoIcons.back,color: Primarycolor,size: 25,),
    onPressed: (){Navigator.of(context).pop();},
    ),
    title: Text("Order Details ",style: TextStyle(color: Primarycolor),),



    ),
    body:
      BlocBuilder<DetailsOrderCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        }));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
