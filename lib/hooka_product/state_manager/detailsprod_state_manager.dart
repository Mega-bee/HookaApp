import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/Hooka%20Basket/basket_routes.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/hooka_product/request/add_to_cart_request.dart';
import 'package:injectable/injectable.dart';
import '../../Hooka Basket/repository/basket_repository.dart';
import '../../Hooka Basket/request/item_delete_request.dart';
import '../product_routes.dart';
import '../repository/product_repository.dart';
import '../response/detailsprod_response.dart';
import '../ui/screen/prod_details.dart';
import '../ui/state/detailsprod_init_state.dart';

@injectable
class ProdDetailsCubit extends Cubit<States> {
  final ProductsRepository _productsRepository;
  final BasketRepository _basketRepository;
  final AuthService _authService;

  ProdDetailsCubit(
      this._productsRepository, this._authService, this._basketRepository)
      : super(LoadingState());

  getDetailsProd(DetailsProductState screenState, String id) {
    emit(LoadingState());
    _productsRepository.getDetailsProd(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getDetailsProd(screenState, "");
            }));
      } else if (value.code == 200) {
        List<DetailsProductResponse> detailsss = [];
        for (var item in value.data.insideData) {
          detailsss.add(DetailsProductResponse.fromJson(item));

          emit(DetailsProdInitState(
              detailsss, screenState, _authService.isLoggedIn, ));
        }
      }
    });
  }

  AddToCart(DetailsProductState screenState, AddToCartRequest request) {
    _productsRepository.addToCart(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              AddToCart(screenState, request);
            }));
      } else if (value.code == 200) {}
    });
  }

  DeleteItemCart(
      DetailsProductState screenState, DeleteItemCarttRequest request) {
    _basketRepository.DeleteItem(request).then((value) {
      if (value == null) {
        Fluttertoast.showToast(msg: "some thing wrong");
      } else if (value.code == 200) {}
    });
  }
}
