import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/Model/LoginPageModel.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import '../repository/invitations_repository.dart';
import '../request/status_inv_request.dart';
import '../response/received_invitation_response.dart';
import '../ui/screen/received_tab.dart';
import '../ui/state/received_init_state.dart';




@injectable
class RecInvitationCubit extends Cubit<States> {
  final InvitationsRepository _invitationsRepository;
  final AuthService _authService;

  RecInvitationCubit(this._invitationsRepository, this._authService) : super(LoadingState());


  getReceivedInv(ReceivedTabState screenState) {

    emit(LoadingState());
    _invitationsRepository.getRecevedInvitation().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getReceivedInv(screenState);
            }));
      } else if (value.code == 200) {
        List<ReceivedInvitationResponse> r = [];
        for (var item in value.data.insideData) {
          r.add(ReceivedInvitationResponse.fromJson(item));
        }
        emit(ReceivedInitState(r,screenState));
      }
    });
  }
  StatusInv(
      ReceivedTabState screenState, StatusInvRequest request, String? id) {
    _invitationsRepository.InvitationsStatus(request, id).then((value) {
      if (value == null) {
        print("${request.statusId}");
        emit(ErrorState(
            errorMessage: 'Connection error',

            retry: () {
              getReceivedInv(screenState);
            }));}
      else if (value.code == 201) {

        getReceivedInv(screenState);

        request.statusId ==2
            ? Fluttertoast.showToast(msg: "Invitation Accepted")
            : Fluttertoast.showToast(msg: "Invitation Rejected");
      }

    });
  }
}

