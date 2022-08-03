import 'package:flutter/material.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/auth/ui/screens/otp_screen.dart';
import 'package:injectable/injectable.dart';
import 'otp_routes.dart';

@injectable
class OtpModule extends RoutModule {
  final PinCodeVerificationScreen _pinCodeVerificationScreen;

  OtpModule(this._pinCodeVerificationScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      OtpRoutes.OTP_SCREEN: (context) => _pinCodeVerificationScreen,
    };
  }
}
