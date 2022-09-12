import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/hooka_buddies/request/buddies_filter_request.dart';
import 'package:hooka/hooka_buddies/request/invite_request.dart';
import 'package:hooka/hooka_places/repository/places_repository.dart';
import 'package:hooka/hooka_places/response/places_response.dart';
import 'package:hooka/module_deep_links/service/deep_links_service.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../../hooka_places/request/filter_places_request.dart';
import '../repository/buddies_repository.dart';
import '../response/buddies_response.dart';
import '../response/invitation_options_response.dart';
import '../ui/screens/buddies.dart';
import '../ui/screens/invite.dart';
import '../ui/state/buddies_init_state.dart';
import '../ui/state/invite_init_state.dart';

@injectable
class BuddiesCubit extends Cubit<States> {
  final BuddiesRepository _buddiesRep;
  final PlacesRepository _placesRepository;

  BuddiesCubit(
    this._buddiesRep,
    this._placesRepository,
  ) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;


  getBudd(BuddiesState screenState) async{
    emit(LoadingState());
    var myLocation = await DeepLinksService.defaultLocation();
    LatLng myPos = LatLng(
        myLocation?.latitude ?? 0, myLocation?.longitude ?? 0);
    _buddiesRep.getBuddiessss(BuddiesFilerRequest(myPos.longitude.toString(), myPos.latitude.toString())).then((value) {
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
        emit(BuddiesInitState(
          screenState,
          b,
        ));
      }
    });
  }

  getOptionInv(InviteBuddiesState screenState) {
    emit(LoadingState());
    _buddiesRep.getInvOptions().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getOptionInv(screenState,);
            }));
      } else if (value.code == 200) {
        List<InvitationOptionsResponse> options = [];
        for (var item in value.data.insideData) {
          options.add(InvitationOptionsResponse.fromJson(item));
        }
        _placesRepository.getPlaces(FilterRequest(1)).then((value) {
          if (value == null) {
          } else if (value.code == 200) {
            List<PlacesResp> places = [];
            for (var item in value.data.insideData) {
              places.add(PlacesResp.fromJson(item));
            }

            emit(InviteInitState(screenState, options, places));
          }
        });
      }
    });
  }

  sendInvitation(InviteBuddiesState inviteBuddiesState, InviteRequest request) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    print('dddddddddddddddddddddddddddd');
    _buddiesRep.sendInvitation(request).then((value) {
      if (value == null) {
        Fluttertoast.showToast(msg: 'connection error');
      } else if (value.code == 201) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Navigator.pop(inviteBuddiesState.context);
        Fluttertoast.showToast(msg: 'Invitation sent sucessfully');
      }
    });
  }
}
