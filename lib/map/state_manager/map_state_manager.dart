import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/hooka_buddies/repository/buddies_repository.dart';
import 'package:hooka/hooka_buddies/request/buddies_filter_request.dart';
import 'package:hooka/hooka_buddies/response/buddies_response.dart';
import 'package:hooka/module_deep_links/service/deep_links_service.dart';
import 'package:injectable/injectable.dart';
import '../../hooka_places/repository/places_repository.dart';
import '../../hooka_places/request/filter_places_request.dart';
import '../../hooka_places/response/places_response.dart';
import '../ui/screen/map_screen.dart';
import '../ui/state/map_init_state.dart';


@injectable
class MapCubit extends Cubit<States> {
  final PlacesRepository _placesRepository;
  final BuddiesRepository _buddiesRepository;
  final AuthService _authService;

  MapCubit(this._placesRepository, this._authService , this._buddiesRepository) : super(LoadingState());


  getPlacess(LocationMapState screenState,FilterRequest request) {

    emit(LoadingState());
    _placesRepository.getPlaces(request).then((value) async {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getPlacess(screenState,request);
            }));
      } else if (value.code == 200) {
        List<PlacesResp> p = [];
        for (var item in value.data.insideData) {
          p.add(PlacesResp.fromJson(item));
        }
        var myLocation = await DeepLinksService.defaultLocation();
        LatLng myPos = LatLng(
            myLocation?.latitude ?? 0, myLocation?.longitude ?? 0);
        emit(MapInitState(screenState,placesResp: p,buddies: [],myLocation: myPos));
      }
    });
  }
  getBuddies(LocationMapState screenState) async{
    emit(LoadingState());
    var myLocation = await DeepLinksService.defaultLocation();
    LatLng myPos = LatLng(
        myLocation?.latitude ?? 0, myLocation?.longitude ?? 0);

    _buddiesRepository.getBuddiessss(BuddiesFilerRequest(myPos.longitude.toString(), myPos.latitude.toString())).then((value)  {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getBuddies(screenState);
            }));
      } else if (value.code == 200) {
        List<BuddiesResp> p = [];
        for (var item in value.data.insideData) {
          p.add(BuddiesResp.fromJson(item));
        }

        emit(MapInitState(screenState,buddies: p ,myLocation:myPos ,placesResp: []));
      }
    });
  }
}

