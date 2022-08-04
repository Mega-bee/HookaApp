// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hooka/abstracts/states/state.dart';
// import 'package:hooka/auth/request/login_request.dart';
// import 'package:hooka/auth/state_manager/login_state_manager.dart';
// import 'package:hooka/auth/ui/states/login_init_state.dart';
// import 'package:injectable/injectable.dart';
//
// @injectable
// class ForgetScreen extends StatefulWidget {
//   final LoginCubit  cubit;
//   ForgetScreen({required this.cubit});
//
//   @override
//   State<ForgetScreen> createState() => ForgetScreenState();
// }
//
// class ForgetScreenState extends State<ForgetScreen> {
//
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     widget.cubit.emit(LoginInitState(this,""));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//         ),
//         body: BlocBuilder<LoginCubit, States>(
//           bloc: widget.cubit,
//           builder: (context, state) {
//             return state.getUI(context);
//           },
//         ));
//   }
// }
