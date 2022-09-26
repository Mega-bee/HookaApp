import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import '../../module_deep_links/service/deep_links_service.dart';
import '../repository/places_repository.dart';
import '../request/filter_places_request.dart';
import '../request/isfav_request.dart';
import '../response/cuisine_response.dart';
import '../response/places_response.dart';
import '../ui/screen/hooka_places.dart';
import '../ui/state/places_init_state.dart';

@injectable
class PlacesCubit extends Cubit<States> {
  final PlacesRepository _placesRepository;
  final AuthService _authService;

  PlacesCubit(this._placesRepository, this._authService) : super(LoadingState());


  getPlacess(HookaPlacesState screenState,FilterRequest request) async{
    var myLocation = await DeepLinksService.defaultLocation();
    LatLng myPos = LatLng(
        myLocation?.latitude ?? 0, myLocation?.longitude ?? 0);

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
          _placesRepository.getCuisines().then((value) {
            if (value == null) {
              emit(ErrorState(
                  errorMessage: 'Connection error',
                  retry: () {
                    getCuisines(screenState,);
                  }));
            } else if (value.code == 200) {
              List<CuisinesResponse> cuis = [];
              for (var item in value.data.insideData) {
                cuis.add(CuisinesResponse.fromJson(item));
              }
              emit(PlaceInitState(items:cuis ,screenState, placesModell: p,myPos.longitude.toString(),myPos.latitude.toString()));


            }

          }
          );

        }
      });
    }
  getCuisines(HookaPlacesState screenState,) async{

    emit(LoadingState());

  }
  IsFavo(
      HookaPlacesState screenState, IsFavorite request, String? id) {
    _placesRepository.IsFav(id, request).then((value) {
      if (value!.code == 200) {



      }else if (value.code == 201){



      };
    });

  }
  }

