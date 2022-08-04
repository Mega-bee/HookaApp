import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:rxdart/rxdart.dart';

import '../../home_page/home_module.dart';
import '../auth_routes.dart';
import '../response/response.dart';

@injectable
class LoginCubit extends Cubit<States> {
  final LoginRepository _loginRepository;
  final AuthService _authService;
  LoginCubit(this._loginRepository,this._authService) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  login(LogRequest request,loginScreenState screenState) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _loginRepository.loginRequest(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
//        emit(ErrorState(errorMessage: 'Connection error', retry: () {}));
      } else if (value.code == 200) {
        logInModel TT = logInModel.fromJson(value.data);
        _authService.setToken(TT.token  ?? "");
      Navigator.pushNamed(screenState.context, HomeRoutes.HOME_SCREEN);
      }else if (value.code != 200){
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: value.errorMessage);
//        emit(LoginInitState(screenState,value.errorMessage ));
      }
    });

  }

}
