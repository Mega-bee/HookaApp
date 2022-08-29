import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/auth/auth_routes.dart';
import 'package:hooka/auth/ui/screens/forgot_otp_screen.dart';
import 'package:hooka/auth/ui/screens/fotgot_screen.dart';
import 'package:hooka/auth/ui/screens/login_screen.dart';
import 'package:hooka/auth/ui/screens/otp_screen.dart';
import 'package:hooka/auth/ui/screens/signup_screen.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthModule extends RoutModule {
  final loginScreen _loginScreen;
  final SignupScreen _signupScreen;
  final PinCodeVerificationScreen _pinCodeVerificationScreen;
  final VerificationOtpForgotScreen _forgotOtpScreen;
  final ForgotScreen _forgotScreen;

  AuthModule(this._loginScreen,this._signupScreen, this._pinCodeVerificationScreen,this._forgotScreen,this._forgotOtpScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AuthRoutes.LOGIN_SCREEN: (context) => _loginScreen,
      AuthRoutes.SIGNUP_SCREEN: (context) => _signupScreen,
      AuthRoutes.OTP_SCREEN: (context) => _pinCodeVerificationScreen,
      AuthRoutes.FORGOT_OTP_SCREEN: (context) => _forgotOtpScreen,
      AuthRoutes.FORGOT_SCREEN: (context) => _forgotScreen,
    };
  }
}
