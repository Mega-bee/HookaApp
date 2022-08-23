
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';

import '../repository/basket_repository.dart';
import '../request/item_delete_request.dart';
import '../request/update_basket_request.dart';
import '../response/basket_response.dart';
import '../ui/screen/basket_screen.dart';
import '../ui/state/basket_init_state.dart';



@injectable
class BasketCubit extends Cubit<States> {
  final BasketRepository _basketRepository;
  final AuthService _authService;

  BasketCubit(this._basketRepository, this._authService) : super(LoadingState());


  getBasketttt(BasketScreenState screenState,) {

    emit(LoadingState());
    _basketRepository.getBaskett().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getBasketttt(screenState,);
            }));
      } else if (value.code == 200) {
        BasketResponse det =
        BasketResponse.fromJson(value.data.insideData);
        emit(BasketInitState(det,screenState,));
      }
    });
  }
  updateeeeeeeCart(
      BasketScreenState screenState,UpdateCartRequest request,) {
    emit(LoadingState());
    _basketRepository.updateCart(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {

            }));
      } else if (value.code == 200) {
        getBasketttt(screenState,);

        Fluttertoast.showToast(msg: "Cart Updated Successfully");

        print('review add successfully');

      }
    });
  }
  DeleteItemCart(
      BasketScreenState screenState,DeleteItemCarttRequest request) {

    _basketRepository.DeleteItem(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {

            }));
      } else if (value.code == 200) {


        Fluttertoast.showToast(msg: "Item Deleted Successfully");

        print('review add successfully');

      }
    });
  }

}