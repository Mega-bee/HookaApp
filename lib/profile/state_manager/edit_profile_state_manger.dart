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
import 'package:hooka/profile/request/add_experience_request.dart';
import 'package:hooka/profile/request/update_profile_request.dart';
import 'package:hooka/profile/ui/state/edit_init_state.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/profile_repository.dart';
import '../request/add_education_request.dart';
import '../response/profile_response.dart';
import '../ui/screens/edit_profile.dart';
import '../ui/screens/profile.dart';
import '../ui/state/profile_init_state.dart';




@injectable
class GetEditProfileCubit extends Cubit<States> {
  final ProfileRepository _profileRepository;
  final AuthService _authService;

  GetEditProfileCubit(this._profileRepository, this._authService) : super(LoadingState());


  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  AddEducation(
      EditProfileState screenState, AddEducationRequest request,) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _profileRepository.AddEducation(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {

            }));
      } else if (value.code == 201) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());

        Navigator.pop(screenState.context);
        Fluttertoast.showToast(msg: "Education Added Successfully");








      }
    });
  }
  AddExperience(
      EditProfileState screenState, AddExperienceRequest request,) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _profileRepository.AddExperience(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {

            }));
      } else if (value.code == 200) {

        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: "Experience Added Successfully");
        screenState.refresh();



      }
    });
  }
  UpdateProfile(
      EditProfileState screenState, UpdateProfileRequest request,) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _profileRepository.UpdateProfile(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {

            }));
      } else if (value.code == 200) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: "Experience Added Successfully");
        screenState.refresh();
      }
    });
  }

  }

