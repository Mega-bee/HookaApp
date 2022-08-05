import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/Model/LoginPageModel.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/repository/login_repository.dart';
import 'package:hooka/auth/request/forget_pass_request.dart';
import 'package:hooka/auth/request/login_request.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/auth/ui/screens/login_screen.dart';
import 'package:hooka/auth/ui/states/login_init_state.dart';
import 'package:hooka/home_page/home_routes.dart';
import 'package:hooka/hooka_places/request/isfav_request.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/places_repository.dart';
import '../response/details_response.dart';
import '../response/places_response.dart';
import '../ui/screen/hooka_places.dart';
import '../ui/screen/places_details.dart';
import '../ui/state/details_init_state.dart';
import '../ui/state/places_init_state.dart';

@injectable
class DetailsCubit extends Cubit<States> {
  final PlacesRepository _placesRepository;
  final AuthService _authService;

  DetailsCubit(this._placesRepository, this._authService) : super(LoadingState());


  getDetails(PlacesDetailsState screenState,String id) {

    emit(LoadingState());
    _placesRepository.getDetails(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getDetails(screenState,"");
            }));
      } else if (value.code == 200) {
        DetailsRep det =
        DetailsRep.fromJson(value.data.insideData);

        emit(DetailsInitState(screenState,det));
      }
    });
  }
  IsFavo(
      PlacesDetailsState screenState, IsFavorite request, String? id) {
    _placesRepository.IsFav(id, request).then((value) {
      if (value!.code == 200) {
        request.isFav
            ? Fluttertoast.showToast(msg: "Place added to favorites")
            : Fluttertoast.showToast(msg: "Place removed from favorites");
      }
    });
  }
}

