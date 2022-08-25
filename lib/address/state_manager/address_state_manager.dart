import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/Model/LoginPageModel.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/address/request/address_request.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../../my_orders/order_routes.dart';
import '../repository/address_repository.dart';
import '../response/address_response.dart';
import '../ui/screen/Address_screen.dart';
import '../ui/state/address_init_state.dart';


@injectable
class AddressCubit extends Cubit<States> {
  final AddressRepository _addressRepository;
  final AuthService _authService;

  AddressCubit(this._addressRepository, this._authService) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;
getAddressesssss(AddresScreenState screenState,) {

  emit(LoadingState());
  _addressRepository.getAddresses().then((value) {
    if (value == null) {
      emit(ErrorState(
          errorMessage: 'Connection error',
          retry: () {
            getAddressesssss(screenState,);
          }));
    } else if (value.code == 200) {
      List<AddressResponse> r = [];
      for (var item in value.data.insideData) {
        r.add(AddressResponse.fromJson(item));
        // BasketResponse det =
        // BasketResponse.fromJson(value.data.insideData);
        emit(AddressInitState(r,screenState));
      }


    }
  });
}
  OrderNoww(
      AddresScreenState screenState,OrderRequest request) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _addressRepository.makeOrder(request).then((value) {
      if (value?.code == 200) {
        Fluttertoast.showToast(msg: 'Your Order Has Been Successfully');
Navigator.pushNamed(screenState.context, OrderRoutes.ORDER_SCREEN,arguments:true);
      }else if (value?.code != 200){
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Something went wrong');
//        emit(LoginInitState(screenState,value.errorMessage ));
      }
    });

  }
}

