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
final OtpCubit cubit ;
// final SignUpCubit cubit ;
PinCodeVerificationScreen(this.cubit,);
  @override
  PinCodeVerificationScreenState createState() =>
      PinCodeVerificationScreenState();
}

class PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  late AsyncSnapshot loadingSnapshot;
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
    loadingSnapshot = AsyncSnapshot.nothing();
    widget.cubit.loadingStream.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshot = event;
        });
      }
    });
    // widget.cubit.emit(OtpInitState(this,""));
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
      if (args != null && args is Map) {
        String email = args['email'];
        String pass = args['pass'];
        widget.cubit.emit(OtpInitState(email,this,'',pass));
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
      body: BlocBuilder<OtpCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      )
    );
  }
}
