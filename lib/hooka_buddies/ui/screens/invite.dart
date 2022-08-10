import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../state_manager/Buddies_state_manager.dart';
@injectable
class InviteBuddies extends StatefulWidget {
  final BuddiesCubit cubit;

  InviteBuddies(this.cubit);

  @override
  State<InviteBuddies> createState() => InviteBuddiesState();
}

class InviteBuddiesState extends State<InviteBuddies> {
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  @override
  void initState() {
    super.initState();
    widget.cubit.getOptionInv(this);

    // buddiesModel = BuddiesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
    onPressed: (){Navigator.of(context).pop();},
        ),
        backgroundColor: Colors.white,
        title: Text("Invite",style: TextStyle(color: Colors.black),),
      ),
      body:
      BlocBuilder<BuddiesCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      )




    );
  }
}
