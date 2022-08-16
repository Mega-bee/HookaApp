import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hooka/Hooka%20Basket/model/basket.dart';
import 'package:hooka/Hooka%20Basket/ui/widget/basket_card.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../state_manager/basket_state_manager.dart';
@injectable
class BasketScreen extends StatefulWidget {
 final BasketCubit cubit;
 BasketScreen(this.cubit);





  @override

  State<BasketScreen> createState() => BasketScreenState();
}

class BasketScreenState extends State<BasketScreen> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getBasketttt(this);
  }
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  num Total1 =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Primarycolor,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Hooka Basket",
            style: TextStyle(color: Colors.black),
          )),
      body:BlocBuilder<BasketCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      )

    );
  }
}
