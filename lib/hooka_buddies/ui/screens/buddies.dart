import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/hooka_buddies/state_manager/Buddies_state_manager.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../Model/BuddiesModel.dart';
import '../../response/buddies_response.dart';
import '../widget/SearchWidgetBuddies.dart';
import '../widget/buddies_card.dart';
@injectable
class Buddies extends StatefulWidget {
final BuddiesCubit cubit;

Buddies(this.cubit);

  @override
  State<Buddies> createState() => BuddiesState();
}

class BuddiesState extends State<Buddies> {
  late List<BuddiesResp> buddiesModel;
  String query = '';

  @override
  void initState() {
    super.initState();
    widget.cubit.getBudd(this);

    // buddiesModel = BuddiesList;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(

        elevation: 1,
        backgroundColor: Colors.white,
        title: Text('Buddies',style: TextStyle(color: Primarycolor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},

        ),
        actions: [
          TextButton(onPressed: (){}, child: Text("Map",style: TextStyle(fontSize: 18),))
        ],
      ) ,
      body:  BlocBuilder<BuddiesCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      )
    );
  }
  // void searchBuddies(String query) {
  //   final Buddies = BuddiesList.where((BuddiesModel) {
  //     final nameLower = BuddiesModel.name!.toLowerCase();
  //     final searchLower = query.toLowerCase();
  //
  //     return nameLower.contains(searchLower);
  //   }).toList();
  //
  //   setState(() {
  //     this.query = query;
  //     this.buddiesModel = Buddies;
  //   });
  }

