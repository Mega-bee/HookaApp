import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/Model/LoginPageModel.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/repository/login_repository.dart';
import 'package:hooka/auth/request/login_request.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/auth/ui/screens/login_screen.dart';
import 'package:hooka/auth/ui/states/login_init_state.dart';
import 'package:hooka/home_page/home_routes.dart';
import 'package:injectable/injectable.dart';

import '../../home_page/home_module.dart';
import '../auth_routes.dart';

@injectable
class LoginCubit extends Cubit<States> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(LoadingState());

  login(LogRequest request,loginScreenState screenState) {
    emit(LoadingState());
    _loginRepository.loginRequest(request).then((value) {
      if (value == null) {
        emit(ErrorState(errorMessage: 'Connection error', retry: () {}));
      } else if (value.code == 200) {
      Navigator.pushNamed(screenState.context, HomeRoutes.HOME_SCREEN);
      }else if (value.code != 200){
        emit(LoginInitState(screenState,value.errorMessage ));
      }
    });

  }

}
