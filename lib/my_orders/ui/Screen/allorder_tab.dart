import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/all_order_state_manager.dart';

@injectable
class AllOrderTabb extends StatefulWidget {
  final AllOrderCubit cubit;
  AllOrderTabb(this.cubit);

  @override
  State<AllOrderTabb> createState() => AllOrderTabbState();
}

class AllOrderTabbState extends State<AllOrderTabb> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
  widget.cubit.getAllOrder(this);
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllOrderCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
