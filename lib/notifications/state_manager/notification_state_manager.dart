import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';

import '../../hooka_places/request/filter_places_request.dart';
import '../repository/notification_repository.dart';
import '../response/notification_response.dart';
import '../ui/screen/notifications.dart';
import '../ui/state/notification_init_state.dart';


@injectable
class NotificationCubit extends Cubit<States> {
  final NotificationRepository _placesRepository;
  final AuthService _authService;

  NotificationCubit(this._placesRepository, this._authService) : super(LoadingState());


  getNotification(NotificationsState screenState,) {

    emit(LoadingState());
    _placesRepository.GetNotifications().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getNotification(screenState,);
            }));
      } else if (value.code == 200) {
        List<NotificationsResponse> p = [];
        for (var item in value.data.insideData) {
          p.add(NotificationsResponse.fromJson(item));}


        emit(NotificationInitState(p,screenState,));
      }
    });
  }
}

