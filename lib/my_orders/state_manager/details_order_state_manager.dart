
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import '../repository/order_repository.dart';
import '../response/details_order_response.dart';
import '../response/order_response.dart';
import '../ui/Screen/allorder_tab.dart';
import '../ui/Screen/order_details.dart';
import '../ui/state/Details_init_state.dart';
import '../ui/state/allorder_init_state.dart';







@injectable
class DetailsOrderCubit extends Cubit<States> {
  final OrderRepository _orderRepository;
  final AuthService _authService;

  DetailsOrderCubit(this._orderRepository, this._authService) : super(LoadingState());


  getOrderDetails(OrderDetailsState screenState,String? id) {

    emit(LoadingState());
    _orderRepository.getOrderDetails(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getOrderDetails(screenState,"");
            }));
      } else if (value.code == 200) {
        DetailsResponse s =
        DetailsResponse.fromJson(value.data.insideData);
        emit(OrderDetailsInitState(s, screenState));
      }

    }
    );
  }


}

