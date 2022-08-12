
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import '../../profile/ui/state/profile_init_state.dart';
import '../repository/buddies_repository.dart';
import '../response/buddies_response.dart';
import '../response/invitation_options_response.dart';
import '../response/profile_buddies_response.dart';
import '../ui/screens/buddies.dart';
import '../ui/screens/invite.dart';
import '../ui/screens/view_profile.dart';
import '../ui/state/buddies_init_state.dart';
import '../ui/state/invite_init_state.dart';
import '../ui/state/profile_buddies_init_state.dart';


@injectable
class ProfileBuddiesCubit extends Cubit<States> {
  final BuddiesRepository _buddiesRep;
  final AuthService _authService;

  ProfileBuddiesCubit(this._buddiesRep, this._authService) : super(LoadingState());


  getBuddProfff(ViewProfileBuddieState screenState,String id) {

    emit(LoadingState());
    _buddiesRep.getBuddiesProf(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getBuddProfff(screenState,"");
            }));
      } else if (value.code == 200) {
        BuddiesProfResponse det =
        BuddiesProfResponse.fromJson(value.data.insideData);
        emit(ProfileBuddiesInitState(det,screenState,));
      }
    });
  }

}