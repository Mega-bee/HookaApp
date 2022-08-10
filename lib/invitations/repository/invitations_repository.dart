import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';



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


}