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
import 'package:hooka/profile/ui/state/edit_init_state.dart';
import 'package:injectable/injectable.dart';

import '../repository/profile_repository.dart';
import '../response/profile_response.dart';
import '../ui/screens/edit_profile.dart';
import '../ui/screens/profile.dart';
import '../ui/state/profile_init_state.dart';




@injectable
class GetProfileCubit extends Cubit<States> {
  final ProfileRepository _profileRepository;
  final AuthService _authService;

  GetProfileCubit(this._profileRepository, this._authService) : super(LoadingState());


  getProfile(ProfileState screenState) {

    emit(LoadingState());
    _profileRepository.getProfile().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getProfile(screenState);
            }));
      } else if (value.code == 200) {
        ProfileResponse det =
        ProfileResponse.fromJson(value.data.insideData);
        screenState.profileResponse = det;
        // List<ProfileResponse> det = [];
        // for (var item in value.data.insideData) {
        //   det.add(ProfileResponse.fromJson(item));
        // }
        emit(ProfileInitState(det,screenState));
      }
    });
  }
  getEditProfile(EditProfileState screenState) {


    _profileRepository.getProfile().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getEditProfile(screenState);
            }));
      } else if (value.code == 200) {
        ProfileResponse det =
        ProfileResponse.fromJson(value.data.insideData);
        screenState.mod = det;
        emit(EditInitState(screenState,det));
      }
    });
  }
}

