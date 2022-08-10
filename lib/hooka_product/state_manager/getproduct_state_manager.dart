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
import 'package:hooka/auth/ui/screens/login_screen.dart';
import 'package:hooka/auth/ui/states/login_init_state.dart';
import 'package:hooka/home_page/home_routes.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/product_repository.dart';
import '../response/getproduct_response.dart';
import '../ui/screen/hooka_product.dart';
import '../ui/state/product_init_state.dart';



@injectable
class GetProductCubit extends Cubit<States> {
  final ProductsRepository _productsRepository;
  final AuthService _authService;

  GetProductCubit(this._productsRepository, this._authService) : super(LoadingState());


  getProduct(HookaProductState screenState) {

    emit(LoadingState());
    _productsRepository.getProduct().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getProduct(screenState);
            }));
      } else if (value.code == 200) {
        List<GetAllProductResponse> prod = [];
        for (var item in value.data.insideData) {
          prod.add(GetAllProductResponse.fromJson(item));
        }
        emit(ProductInitState(prod,screenState));
      }
    });
  }
}

