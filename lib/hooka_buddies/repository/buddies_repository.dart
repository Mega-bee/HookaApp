import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/hooka_buddies/request/buddies_filter_request.dart';
import 'package:hooka/hooka_buddies/request/invite_request.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';



@injectable
class BuddiesRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  BuddiesRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getBuddiessss(BuddiesFilerRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.BUDDIES,queryParams: request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> getInvOptions() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.OTIONS_INVITATIONS,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> getBuddiesProf(String? id) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.BUDDIES_PROFILE +"$id",
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> sendInvitation(InviteRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.INVITE_BUDDY  ,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

}