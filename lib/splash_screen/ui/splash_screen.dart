import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooka/auth/auth_routes.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/home_page/home_routes.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashScreen extends StatefulWidget {
  final AuthService _authService;
  const SplashScreen(this._authService);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("Splash delay");
      Future.delayed(Duration(seconds: 2));
      Timer(Duration(milliseconds: 1500), () {
        if (widget._authService.isLoggedIn) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeRoutes.HOME_SCREEN, (route) => false);
        } else
          Navigator.pushNamedAndRemoveUntil(
              context, HomeRoutes.HOME_SCREEN, (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // height: value,
          child: Center(
              child: Image.asset(
                ImageAsset.LOGO,
                fit: BoxFit.cover,
                height: 600,
              )),
        )
      ),
    );
  }
}
