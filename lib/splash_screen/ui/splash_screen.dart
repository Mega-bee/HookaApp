import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooka/auth/auth_routes.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/home_page/home_routes.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

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
              context, AuthRoutes.LOGIN_SCREEN, (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlayAnimation<double>(
            duration: Duration(milliseconds: 1200),
            // delay: Duration(milliseconds: 400),
            tween: Tween(begin: 20.0, end: 550),
            builder: (context, child, value) {
              return Container(
                height: value,
                child: Center(
                    child: Image.asset(
                  ImageAsset.LOGO,
                  fit: BoxFit.cover,
                  height: 600,
                )),
              );
            }),
      ),
    );
  }
}
