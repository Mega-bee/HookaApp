import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/otp_routes.dart';
import 'package:hooka/auth/repository/login_repository.dart';

import 'package:injectable/injectable.dart';

import '../request/signup_request.dart';
import '../ui/screens/signup_screen.dart';

@injectable
class SignUpCubit extends Cubit<States> {
  final LoginRepository _loginRepository;

  SignUpCubit(this._loginRepository) : super(LoadingState());

  Signup(SignRequest request,SignupScreenState screenState) {
    emit(LoadingState());
    _loginRepository.SignUpRequest(request).then((value) {
      if (value == null) {
        emit(ErrorState(errorMessage: 'Connection error', retry: () {}));
      } else if (value.code == 200) {
        Navigator.pushNamed(screenState.context, OtpRoutes.OTP_SCREEN);
      }
    });
  }
}
