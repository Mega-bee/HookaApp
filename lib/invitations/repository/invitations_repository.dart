import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

import '../request/status_inv_request.dart';



@injectable
class InvitationsRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  InvitationsRepository(this._apiClient,this._authService);

  Future<WebServiceResponse?> getRecevedInvitation() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.RECEIVED_INVITATIONS,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> getSentInvitation() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.SENT_INVITATIONS,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> getDetailsSentInvitation(String? id) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.SENT_INV_DETAILS +"$id",
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> InvitationsStatus(StatusInvRequest request,String? id) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.INVITATION_STATUS +"$id",
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

}