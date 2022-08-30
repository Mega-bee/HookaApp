import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/repository/login_repository.dart';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../auth_routes.dart';
import '../request/forgot_request.dart';
import '../service/auth_service.dart';
import '../ui/screens/forgot_otp_screen.dart';
import '../ui/screens/fotgot_screen.dart';

@injectable
class ForgotScreenCubit extends Cubit<States> {
  final LoginRepository _loginRepository;
  final AuthService _authService;

  ForgotScreenCubit(this._loginRepository,this._authService) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;



  ForgotPassScreen(ForgotRequest request,ForgotScreenState screenState) {

    _loginRepository.ForgetPasswordRequest(request).then((value) {
      _loadingStateSubject.add(AsyncSnapshot.waiting());

      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {
        _loadingStateSubject.add(AsyncSnapshot.waiting());
        Navigator.pushNamed(screenState.context, AuthRoutes.LOGIN_SCREEN);
      }
    } );}}



