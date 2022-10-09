import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/hooka_buddies/state_manager/Buddies_state_manager.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../map/map_routes.dart';
import '../../../map/ui/screen/map_screen.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../response/buddies_response.dart';

@injectable
class Buddies extends StatefulWidget {
  final BuddiesCubit cubit;

  Buddies(this.cubit);

  @override
  State<Buddies> createState() => BuddiesState();
}

class BuddiesState extends State<Buddies> {
  int? placeId;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  late List<BuddiesResp> buddiesModel;


  @override
  void initState() {
    super.initState();
    widget.cubit.getBudd(this);
  }
ScrollController? controller2;
  @override
  Widget build(BuildContext context) {
    var  args = ModalRoute.of(context)?.settings.arguments;
    if(args != null && args is int){
      placeId = args;
    }
    return


      ColorfulSafeArea(
          color: Colors.white,

          bottom: false,
          left: false,
          right: false,
        child: Scaffold(
body:
NestedScrollView(
floatHeaderSlivers: true,
controller: controller2,
        headerSliverBuilder: (context,innerBoxIsScrolled){
      return [


      SliverAppBar(
          backgroundColor:Colors.white,
            title: Text(
              'Buddies',
              style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold)
            ),
            leading: IconButton(
              icon: Icon(
                CupertinoIcons.back,
                color: Primarycolor,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MapRoutes.MAP_SCREEN,arguments: '');
                  },
                  child: Text(
                    "Map",
                    style:GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold)
                  ))
            ],
    )];},
          body: BlocBuilder<BuddiesCubit, States>(
            bloc: widget.cubit,
            builder: (context, state) {
              return state.getUI(context);
            },
          )),
      ));
  }
}
