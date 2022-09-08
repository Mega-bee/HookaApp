import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/repository/login_repository.dart';
import 'package:hooka/auth/request/confirm_otp_request.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../auth_routes.dart';
import '../request/gen_otp_request.dart';
import '../service/auth_service.dart';
import '../ui/screens/forgot_otp_screen.dart';

@injectable
class ForgotOtpCubit extends Cubit<States> {
  final LoginRepository _loginRepository;
  final AuthService _authService;

  ForgotOtpCubit(this._loginRepository,this._authService) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  ForgetPasswww(GenOtpRequest request, VerificationOtpForgotScreenState screenState) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _loginRepository.GenerateOtpRequest(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: "Your Code Has Been Recent");

      }
    });
  }

  ForgetPassOtpConf(ConfOtpRequest request,VerificationOtpForgotScreenState screenState) {

    _loginRepository.ConfirmOtpRequest(request).then((value) {
      _loadingStateSubject.add(AsyncSnapshot.waiting());

      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      }  else if (value.code == 200) {
        _loadingStateSubject.add(AsyncSnapshot.waiting());
            // logInModel TT = logInModel.fromJson(value.data.insideData);
            // _authService.setToken(TT.token ??"",);
            // _authService.setName(TT.name ??"");
            // _authService.setToken(value.data.insideData ?? "");
            Navigator.pushNamedAndRemoveUntil(screenState.context, AuthRoutes.FORGOT_SCREEN, (route) => false,arguments: request.email.toString());
          }else if (value.code != 200){
            _loadingStateSubject.add(AsyncSnapshot.nothing());
            Fluttertoast.showToast(msg:"Otp Is Wrong");
//        emit(LoginInitState(screenState,value.errorMessage ));
          }
        });



  }

}
