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
import 'package:hooka/offers/widget/screen/offers.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/offers_repository.dart';
import '../response/offers_details_response.dart';
import '../response/offers_response.dart';
import '../widget/screen/offers_details_screens.dart';
import '../widget/state/offers_details_init_state.dart';
import '../widget/state/offers_init_state.dart';


@injectable
class OffersDetailsCubit extends Cubit<States> {
  final OffersRepository _offersRepository;
  final AuthService _authService;

  OffersDetailsCubit(this._offersRepository, this._authService) : super(LoadingState());


  getOffersDetails(OffersDetailsScreenState screenState,String id) {

    emit(LoadingState());
    _offersRepository.getOffDetails(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getOffersDetails(screenState,"");
            }));
      } else if (value.code == 200) {
        OffDetailsResponse offdetailsesp =
        OffDetailsResponse.fromJson(value.data.insideData);
        emit(OffersDetailsInitState(screenState, detailsResponse: offdetailsesp));
      }
    });
  }
}

