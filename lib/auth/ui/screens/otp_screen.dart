import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/auth/state_manager/otp_state_screen.dart';
import 'package:hooka/auth/state_manager/signup_state_manager.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:injectable/injectable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../abstracts/states/state.dart';
import '../../request/confirm_otp_request.dart';
import '../states/otp_init_state.dart';

@injectable
class PinCodeVerificationScreen extends StatefulWidget {
// final OtpCubit cubit ;
final SignUpCubit cubit ;
PinCodeVerificationScreen(this.cubit,);
  @override
  PinCodeVerificationScreenState createState() =>
      PinCodeVerificationScreenState();
}

class PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
bool flags = true;
  void ConfirmOtpRequest(ConfOtpRequest request){
    widget.cubit.OtpConf(request,this);
  }



  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  // snackBar(String? message) {
  //   return ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message!),
  //       duration: const Duration(seconds: 2),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is String) {
        widget.cubit.emit(OtpInitState(args,this,''));
      }
      flags = false;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "Otp Verification",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<SignUpCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      )
    );
  }
}
