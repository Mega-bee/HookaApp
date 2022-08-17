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
Checkout(this.cubit);
  @override
  State<Checkout> createState() => CheckoutState();
}

class CheckoutState extends State<Checkout> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getCheckout(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        leading: MenuWidget(),
        backgroundColor: Colors.white,
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
