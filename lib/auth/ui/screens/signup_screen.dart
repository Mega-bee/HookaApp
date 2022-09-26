import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/auth/request/gen_otp_request.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';

import '../../request/signup_request.dart';
import '../../state_manager/signup_state_manager.dart';
import '../states/signup_init_state.dart';

@injectable
class SignupScreen extends StatefulWidget {
  final SignUpCubit cubit;
  SignupScreen({required this.cubit});
  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  late AsyncSnapshot loadingSnapshot;

  void SignupRequest(SignRequest request){
    widget.cubit.Signup(request,this);
  }
//  void GenerateOtpRequest(GenOtpRequest request){
//    widget.cubit.OtpGen(request,this);
//  }

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
    widget.cubit.emit(SignupInitState(this,"",));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: BlocBuilder<SignUpCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        ));
  }
}
