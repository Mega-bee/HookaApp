
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import '../repository/order_repository.dart';
import '../response/order_response.dart';
import '../ui/Screen/allorder_tab.dart';
import '../ui/state/allorder_init_state.dart';






@injectable
class AllOrderCubit extends Cubit<States> {
  final OrderRepository _orderRepository;
  final AuthService _authService;

  AllOrderCubit(this._orderRepository, this._authService) : super(LoadingState());


  getAllOrder(AllOrderTabbState screenState) {

    emit(LoadingState());
    _orderRepository.getOrder().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getAllOrder(screenState);
            }));
      } else if (value.code == 200) {
        OrderResponse s =
        OrderResponse.fromJson(value.data.insideData);
        emit(AllOrderInitState(s, screenState));
      }

    }
  );
}

}

