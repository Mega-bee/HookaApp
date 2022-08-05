import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/auth_routes.dart';
import 'package:hooka/auth/repository/login_repository.dart';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../request/gen_otp_request.dart';
import '../request/signup_request.dart';
import '../ui/screens/signup_screen.dart';

@injectable
class SignUpCubit extends Cubit<States> {
  final LoginRepository _loginRepository;

  SignUpCubit(this._loginRepository) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  Signup(SignRequest request, SignupScreenState screenState) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _loginRepository.SignUpRequest(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {

        OtpGen(GenOtpRequest(request.phonenumber), screenState , request.phonenumber ?? '');
//         Navigator.pushNamed(screenState.context, OtpRoutes.OTP_SCREEN ,arguments: );
      }
    });
  }

  OtpGen(GenOtpRequest request, SignupScreenState screenState , String number) {
    _loginRepository.GenerateOtpRequest(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: value.errorMessage);
        Navigator.pushNamed(
          screenState.context,
            AuthRoutes.OTP_SCREEN,
          arguments: number
        );
      }
    });
  }


}
