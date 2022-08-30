import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/request/login_request.dart';
import 'package:hooka/auth/state_manager/login_state_manager.dart';
import 'package:hooka/auth/ui/states/login_init_state.dart';
import 'package:injectable/injectable.dart';

import '../../request/gen_otp_request.dart';

@injectable
class loginScreen extends StatefulWidget {
  final LoginCubit  cubit;
  loginScreen({required this.cubit});

  @override
  State<loginScreen> createState() => loginScreenState();
}

class loginScreenState extends State<loginScreen> {
  late AsyncSnapshot loadingSnapshot;

  void loginRequest(LogRequest request){
    widget.cubit.login(request,this);
  }
 void ForgetPasssss(GenOtpRequest request){
    widget.cubit.ForgetPass(request,this);
  }

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
    widget.cubit.emit(LoginInitState(this,""));
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: BlocBuilder<LoginCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        ));
  }
}
