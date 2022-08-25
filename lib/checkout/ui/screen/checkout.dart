import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/checkout_state_manager.dart';

@injectable
class Checkout extends StatefulWidget {
final CheckoutCubit cubit;


Checkout(this.cubit,);
  @override
  State<Checkout> createState() => CheckoutState();
}

class CheckoutState extends State<Checkout> {
  bool flags=true;
  bool checkout=false;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  @override
  void initState() {
    super.initState();
widget.cubit.getCheckout(this,);

  }

  @override
  Widget build(BuildContext context) {
    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is bool) {
        checkout=args;
      }
      flags = false;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),

        leading:

        checkout?IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
          Navigator.pop(context);
        },):
        MenuWidget()
        ,


        elevation: 1,
        // leading: MenuWidget(),

        title: Text("Checkout",style: TextStyle(color: Colors.black),),

      ),
      body:
      BlocBuilder<CheckoutCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ));


  }
}
