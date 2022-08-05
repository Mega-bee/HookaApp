import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooka/profile/ui/profile.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../abstracts/states/state.dart';
import '../../../hooka_product/ui/screen/hooka_product.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../state_manager/details_state_manager.dart';
import '../state/details_init_state.dart';
@injectable
class PlacesDetails extends StatefulWidget {
  final DetailsCubit  cubit;
  PlacesDetails(this.cubit);


  @override
  State<PlacesDetails> createState() => PlacesDetailsState();
}

class PlacesDetailsState extends State<PlacesDetails> {
  bool flags = true;
  @override
  Widget build(BuildContext context) {
    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is String) {
        widget.cubit.getDetails(this,args);
      }
      flags = false;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
          "Details",
          style: TextStyle(color: Primarycolor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_on,
              color: Primarycolor,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body:  BlocBuilder<DetailsCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      )
    );
  }
}
