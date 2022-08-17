import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/Model/LoginPageModel.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/repository/login_repository.dart';
import 'package:hooka/auth/request/forget_pass_request.dart';
import 'package:hooka/auth/request/login_request.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import '../../Hooka Basket/response/basket_response.dart';
import '../repository/checkout_repository.dart';
import '../ui/screen/checkout.dart';
import '../ui/state/checkout_init_state.dart';


@injectable
class CheckoutCubit extends Cubit<States> {
  final CheckoutRepository _checkoutRepository;
  final AuthService _authService;

  CheckoutCubit(this._checkoutRepository, this._authService) : super(LoadingState());


  getCheckout(CheckoutState screenState) {

    emit(LoadingState());
    _checkoutRepository.getCheckoutBasket().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getCheckout(screenState);
            }));
      } else if (value.code == 200) {
        BasketResponse det =
        BasketResponse.fromJson(value.data.insideData);
        emit(CheckoutInitState(det,screenState));
      }
    });
  }
}

