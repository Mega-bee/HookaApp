import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/address/request/address_request.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../state_manager/address_state_manager.dart';
@injectable
class AddresScreen extends StatefulWidget {
  final AddressCubit cubit;
  AddresScreen(this.cubit);


  @override
  State<AddresScreen> createState() => AddresScreenState();
}

class AddresScreenState extends State<AddresScreen> {
  late AsyncSnapshot loadingSnapshot;
  int _selectedValue = 0;
  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          width: 300,
          height: 250,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 30,
            scrollController: FixedExtentScrollController(initialItem: 1),
            children: [
            ListView(
              children: [

              ],
            )
            ],
            onSelectedItemChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
            },
          ),
        ));
  }
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  @override
  void initState() {
    super.initState();
    loadingSnapshot = AsyncSnapshot.nothing();
    widget.cubit.loadingStream.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshot = event;
        });
      }
    });

widget.cubit.getAddressesssss(this,);
  }
  Makeorder(OrderRequest request){
    widget.cubit.OrderNoww(this, request);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor:Colors.white ,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined,color: Colors.black,size: 35,),
            onPressed: (){Navigator.of(context).pop();},

          ),

        title: Text("Address",style: TextStyle(color: Colors.black),)

        ),
      body: BlocBuilder<AddressCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
