import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/hooka_buddies/state_manager/Buddies_state_manager.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../map/map_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    var  args = ModalRoute.of(context)?.settings.arguments;
    if(args != null && args is int){
      placeId = args;
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            'Buddies',
            style: TextStyle(color: Primarycolor),
          ),
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
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CustomPageRoute(child:LocationMap()));
                },
                child: Text(
                  "Map",
                  style: TextStyle(fontSize: 18,color: Colors.black),
                ))
          ],
        ),
        body: BlocBuilder<BuddiesCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        ));
  }
}
