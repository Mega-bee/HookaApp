
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/abstracts/states/error_state.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/hooka_places/request/isfav_request.dart';
import 'package:injectable/injectable.dart';
import '../repository/places_repository.dart';
import '../request/addreview_request.dart';
import '../response/details_response.dart';
import '../ui/screen/places_details.dart';
import '../ui/state/details_init_state.dart';

@injectable
class DetailsCubit extends Cubit<States> {
  final PlacesRepository _placesRepository;
  final AuthService _authService;

  DetailsCubit(this._placesRepository, this._authService) : super(LoadingState());


  getDetails(PlacesDetailsState screenState,String id) {

    emit(LoadingState());
    _placesRepository.getDetails(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getDetails(screenState,"");
            }));
      } else if (value.code == 200) {
        DetailsRep det =
        DetailsRep.fromJson(value.data.insideData);

        emit(DetailsInitState(screenState,det));
      }
    });
  }
  IsFavo(
      PlacesDetailsState screenState, IsFavorite request, String? id) {
    _placesRepository.IsFav(id, request).then((value) {
      if (value!.code == 200) {
        Fluttertoast.showToast(msg: "Place removed from favorites");
      getDetails(screenState, id!);

      }else if (value.code == 201){
        Fluttertoast.showToast(msg: "Place added to favorites");
        getDetails(screenState, id!);
      };
    });

  }
  AddReviewstate(
      PlacesDetailsState screenState, AddReviewReq request, String? id) {
    emit(LoadingState());
    _placesRepository.AddRev(id,request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {

            }));
      } else if (value.code == 200) {
        getDetails(screenState, id??"-1");

      Fluttertoast.showToast(msg: "Review Added Successfully");

        print('review add successfully');

      }
    });
  }
}

