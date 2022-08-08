import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/hooka_places/ui/widget/SearchWidgetHookahPlaces.dart';
import 'package:hooka/hooka_places/ui/widget/places_card.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../state_manager/places_state_manager.dart';
import '../model/places_card_model.dart';
import '../model/places_card_model.dart';
import '../model/places_card_model.dart';
import '../model/places_card_model.dart';
@injectable
class HookaPlaces extends StatefulWidget {
  final PlacesCubit  cubit;
  HookaPlaces(this.cubit);

  @override
  State<HookaPlaces> createState() => HookaPlacesState();
}

class HookaPlacesState extends State<HookaPlaces> {
  late List<PlaceModel> placesModel;
  String query = '';

  @override
  void initState() {
    super.initState();
    widget.cubit.getPlacess(this);
    placesModel = placecard;
  }
  @override
  Widget build(BuildContext context) {
    final _textEditingController =TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text('Places',style: TextStyle(color: Primarycolor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},

        ),
        actions: [
          TextButton(onPressed: (){}, child: Text("Map",style: TextStyle(fontSize: 18),))
        ],
      ) ,
      body:   BlocBuilder<PlacesCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      )
    );
  }
  void searchPlaces(String query) {
    final Places = placecard.where((PlaceModel) {
      final nameLower = PlaceModel.title!.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.placesModel = Places;
    });
  }
}



