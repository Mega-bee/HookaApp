import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import '../repository/places_repository.dart';
import '../request/filter_places_request.dart';
import '../response/places_response.dart';
import '../ui/screen/hooka_places.dart';
import '../ui/state/places_init_state.dart';

@injectable
class PlacesCubit extends Cubit<States> {
  final PlacesRepository _placesRepository;
  final AuthService _authService;

  PlacesCubit(this._placesRepository, this._authService) : super(LoadingState());


  getPlacess(HookaPlacesState screenState,FilterRequest request) {

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
          emit(PlaceInitState(screenState, placesModell: p));
        }
      });
    }
  }

