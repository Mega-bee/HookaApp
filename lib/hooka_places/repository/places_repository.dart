import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/request/gen_otp_request.dart';
import 'package:hooka/auth/request/login_request.dart';
import 'package:hooka/auth/request/signup_request.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/hooka_places/request/isfav_request.dart';
import 'package:hooka/hooka_places/request/placesFilterRequest.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

import '../request/addreview_request.dart';
import '../request/filter_places_request.dart';



@injectable
class PlacesRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  PlacesRepository(this._apiClient,this._authService);

  Future<WebServiceResponse?> getPlaces(FilterRequest request,) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GETALLPLACES,queryParams: request.toJson() ,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> getCuisines() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_CUISINES,

      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> getDetails(String? id) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.Details +"$id",
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> IsFav(String? id,IsFavorite request) async {
    var token =   _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.FAVORITE + "$id",
      request.toJson()
      ,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> AddRev(String? id,AddReviewReq request) async {
    var token =   _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.ADD_REVIEW + "$id",
      request.toJson()
      ,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}