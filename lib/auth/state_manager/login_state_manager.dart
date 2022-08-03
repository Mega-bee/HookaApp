import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/repository/login_repository.dart';
import 'package:hooka/auth/request/login_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<States> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(LoadingState());

  login(LoginRequest request) {
    emit(LoadingState());
    _loginRepository.loginRequest(request).then((value) {
      if (value == null) {
        emit(ErrorState(errorMessage: 'Connection error', retry: () {}));
      } else if (value.code == 200) {}
    });
  }
}
