

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

import '../repository/setting_repository.dart';
import '../response/setting_response.dart';
import '../ui/screen/settings.dart';
import '../ui/state/setting_init_state.dart';



@injectable
class SettingCubit extends Cubit<States> {
  final SettingRepository _settingRepository;
  final AuthService _authService;


  SettingCubit(this._settingRepository, this._authService,) : super(LoadingState());




IsAvailable(
    SettingsState screenState,) {
  _settingRepository.Availble().then((value) {
    if (value!.code == 200) {

    }
  });

}
  getSetting(SettingsState screenState) {

    emit(LoadingState());
    _settingRepository.GetSetting().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getSetting(screenState);
            }));
      } else if (value.code == 200) {
        SettingResponse s =
        SettingResponse.fromJson(value.data.insideData);
        // List<ReceivedInvitationResponse> r = [];
        // for (var item in value.data.insideData) {
        //   r.add(ReceivedInvitationResponse.fromJson(item));
        // }
        emit(SettingInitState(s,screenState));
      }
    });
  }
}