import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../hooka_places/request/filter_places_request.dart';
import '../../state_manager/map_state_manager.dart';

@injectable
class LocationMap extends StatefulWidget {
  final MapCubit cubit;
  LocationMap(this.cubit);
  @override
  LocationMapState createState() => LocationMapState();
}

class LocationMapState extends State<LocationMap> {
  FilterRequest? request;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {

    super.initState();
    request=FilterRequest(0);
    widget.cubit.getPlacess(this,request!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hooka Map',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<MapCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          })





    );
  }
}
