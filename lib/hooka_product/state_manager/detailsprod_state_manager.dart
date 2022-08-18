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
import 'package:hooka/hooka_places/request/isfav_request.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/product_repository.dart';
import '../response/detailsprod_response.dart';
import '../ui/screen/prod_details.dart';
import '../ui/state/detailsprod_init_state.dart';



@injectable
class ProdDetailsCubit extends Cubit<States> {
  final ProductsRepository _productsRepository;
  final AuthService _authService;

  ProdDetailsCubit(this._productsRepository, this._authService) : super(LoadingState());


  getDetailsProd(DetailsProductState screenState,String id) {

    emit(LoadingState());
    _productsRepository.getDetailsProd(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getDetailsProd(screenState,"");
            }));
      } else if (value.code == 200) {
        List<DetailsProductResponse> detailsss = [];
        for (var item in value.data.insideData) {
          detailsss.add(DetailsProductResponse.fromJson(item));

        emit(DetailsProdInitState(detailsss,screenState,));
      }
    }});
  }
  AddToCart(DetailsProductState screenState,String Prodid,String quantity) {


    _productsRepository.addToCart(Prodid, quantity).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              AddToCart(screenState,"","");
            }));
      } else if (value.code == 200) {

      }});
  }

}

