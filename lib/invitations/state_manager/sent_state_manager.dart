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
import 'package:hooka/offers/widget/screen/offers.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/invitations_repository.dart';
import '../response/received_invitation_response.dart';
import '../response/sent_details_response.dart';
import '../response/sent_invitation_response.dart';
import '../ui/screen/received_tab.dart';
import '../ui/screen/sent_details.dart';
import '../ui/screen/sent_tab.dart';
import '../ui/state/received_init_state.dart';
import '../ui/state/sent_details_init_state.dart';
import '../ui/state/sent_init_state.dart';




@injectable
class SentInvitationCubit extends Cubit<States> {
  final InvitationsRepository _invitationsRepository;
  final AuthService _authService;

  SentInvitationCubit(this._invitationsRepository, this._authService) : super(LoadingState());


  getSentInv(SentTabState screenState) {

    emit(LoadingState());
    _invitationsRepository.getSentInvitation().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getSentInv(screenState);
            }));
      } else if (value.code == 200) {
        List<SentInvitationResponse> s = [];
        for (var item in value.data.insideData) {
          s.add(SentInvitationResponse.fromJson(item));
        }
        emit(SentInitState(s,screenState));
      }
    });
  }
  getDetailsSentInv(SentDetailsState screenState,String? id ) {

    emit(LoadingState());
    _invitationsRepository.getDetailsSentInvitation(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getDetailsSentInv(screenState,"");
            }));
      } else if (value.code == 200) {
        DetailsSentResponse s =
        DetailsSentResponse.fromJson(value.data.insideData);
        // List<SentInvitationResponse> s = [];
        // for (var item in value.data.insideData) {
        //   s.add(SentInvitationResponse.fromJson(item));
        // }
        emit(DetailsSentInitState(s,screenState));
      }
    });
  }
}

