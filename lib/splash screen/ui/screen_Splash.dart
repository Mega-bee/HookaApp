import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import '../../auth/ui/screens/login_screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {



  @override
  void initState() {
    super.initState();


    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print("Splash delay");
      Future.delayed(Duration(seconds: 2));
      Timer(
          Duration(milliseconds: 1500),
              () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => loginScreen()),
                  (route) => false));


    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: PlayAnimation<double>(

            duration: Duration(milliseconds: 1200),
            // delay: Duration(milliseconds: 400),
            tween: Tween(begin: 20.0,end: 550),
            builder:( context,child,value){return
              Container(

                height:value,
                child: Center(child: Image.asset("assets/images/hooka logo.png",fit: BoxFit.cover,
                  height: 600,
                )),
              );}),
      ),
    );
  }
}