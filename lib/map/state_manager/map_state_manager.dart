import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';

import '../../hooka_places/repository/places_repository.dart';
import '../../hooka_places/request/filter_places_request.dart';
import '../../hooka_places/response/places_response.dart';
import '../ui/screen/map_screen.dart';
import '../ui/state/map_init_state.dart';


@injectable
class MapCubit extends Cubit<States> {
  final PlacesRepository _placesRepository;
  final AuthService _authService;

  MapCubit(this._placesRepository, this._authService) : super(LoadingState());


  getPlacess(LocationMapState screenState,FilterRequest request) {

    emit(LoadingState());
    _placesRepository.getPlaces(request).then((value) {
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
        emit(MapInitState(screenState,p));
      }
    });
  }
}

