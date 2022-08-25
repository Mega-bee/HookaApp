

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';

import '../../hooka_places/ui/screen/places_details.dart';
import '../repository/firebase_token_repository.dart';
import '../request/firebase_request.dart';
import '../ui/screens/home_screen.dart';





@injectable
class FirebaseCubit extends Cubit<States> {
  final FireBaseRepository _fireBaseRepository;
  final AuthService _authService;

  FirebaseCubit(this._fireBaseRepository, this._authService) : super(LoadingState());
FireBasee(
    HomeScreenState screenState, FireRequest request,) {
  _fireBaseRepository.FireBaseNotification(request).then((value) {
    if (value!.code == 200) {

    }
  });
}
}