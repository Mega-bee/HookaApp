import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import '../../../abstracts/states/state.dart';
import '../../../utils/images/images.dart';
import '../../../utils/style/colors.dart';
import '../../state_manager/offers_details_state_manager.dart';
import '../../state_manager/offers_state_manager.dart';
@injectable
class OffersDetailsScreen extends StatefulWidget {
final OffersDetailsCubit cubit;
OffersDetailsScreen(this.cubit);

  @override
  State<OffersDetailsScreen> createState() => OffersDetailsScreenState();
}

class OffersDetailsScreenState extends State<OffersDetailsScreen> {
  bool flags = true;



  @override
  Widget build(BuildContext context) {

    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is String) {
        widget.cubit.getOffersDetails(this,args);
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
          "Offers",
          style: TextStyle(color: Primarycolor),
        ),

      ),
      body: BlocBuilder<OffersDetailsCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
