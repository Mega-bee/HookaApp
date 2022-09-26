import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../buddies_routes.dart';
import '../../state_manager/buddies_profile_state_manager.dart';

@injectable
class ViewProfileBuddie extends StatefulWidget {
final ProfileBuddiesCubit cubit;
ViewProfileBuddie(this.cubit);
  @override
  State<ViewProfileBuddie> createState() => ViewProfileBuddieState();
}

class ViewProfileBuddieState extends State<ViewProfileBuddie> {

  bool flags = true;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is String) {
        widget.cubit.getBuddProfff(this,args);
      }
      flags = false;
    }
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back,color: Primarycolor,size: 25,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text("Profile ",style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold))



      ),
      body:
      BlocBuilder<ProfileBuddiesCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),

    );
  }
}
