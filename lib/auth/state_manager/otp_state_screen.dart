import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/otp_routes.dart';
import 'package:hooka/auth/repository/login_repository.dart';
import 'package:hooka/auth/request/confirm_otp_request.dart';
import 'package:hooka/auth/ui/states/signup_init_state.dart';
import 'package:hooka/home_page/home_routes.dart';

import 'package:injectable/injectable.dart';

import '../request/gen_otp_request.dart';
import '../ui/screens/otp_screen.dart';

@injectable
class OtpCubit extends Cubit<States> {
  final LoginRepository _loginRepository;

  OtpCubit(this._loginRepository) : super(LoadingState());

  OtpConf(ConfOtpRequest request,PinCodeVerificationScreenState screenState) {

    _loginRepository.ConfirmOtpRequest(request).then((value) {
      if (value == null) {
        emit(ErrorState(errorMessage: 'Connection error', retry: () {}));
      } else if (value.code == 200) {
        Navigator.pushNamed(screenState.context, HomeRoutes.HOME_SCREEN);
      }
    });
  }

}
