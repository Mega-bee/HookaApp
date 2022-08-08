
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import '../repository/buddies_repository.dart';
import '../response/buddies_response.dart';
import '../ui/screens/buddies.dart';
import '../ui/state/buddies_init_state.dart';


@injectable
class BuddiesCubit extends Cubit<States> {
  final BuddiesRepository _buddiesRep;
  final AuthService _authService;

  BuddiesCubit(this._buddiesRep, this._authService) : super(LoadingState());


  getBudd(BuddiesState screenState) {

    emit(LoadingState());
    _buddiesRep.getBuddiessss().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getBudd(screenState);
            }));
      } else if (value.code == 200) {
        List<BuddiesResp> b = [];
        for (var item in value.data.insideData) {
          b.add(BuddiesResp.fromJson(item));
        }
        emit(BuddiesInitState(screenState,  b));
      }
    });
  }
}