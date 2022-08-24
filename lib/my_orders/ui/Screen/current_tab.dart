import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/current_order_state_manager.dart';


@injectable
class CurrentTab extends StatefulWidget {
  final CurrentCubit cubit;
  CurrentTab(this.cubit);

  @override
  State<CurrentTab> createState() => CurrentTabState();
}

class CurrentTabState extends State<CurrentTab> with AutomaticKeepAliveClientMixin {
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }



  @override
  void initState() {
    super.initState();
    widget.cubit.getCurrentOrder(this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
