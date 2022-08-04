import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/repository/login_repository.dart';
import 'package:hooka/auth/request/confirm_otp_request.dart';
import 'package:hooka/home_page/home_routes.dart';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../ui/screens/otp_screen.dart';

@injectable
class OtpCubit extends Cubit<States> {
  final LoginRepository _loginRepository;

  OtpCubit(this._loginRepository) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  OtpConf(ConfOtpRequest request,PinCodeVerificationScreenState screenState) {

    _loginRepository.ConfirmOtpRequest(request).then((value) {
      _loadingStateSubject.add(AsyncSnapshot.waiting());

      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {
        Navigator.pushNamed(screenState.context, HomeRoutes.HOME_SCREEN);
      }
      else if (value.code != 200){
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: value.errorMessage);
//        emit(LoginInitState(screenState,value.errorMessage ));
      }
    });
  }

}
