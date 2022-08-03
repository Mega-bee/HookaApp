import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/request/login_request.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  LoginRepository(this._apiClient, this._authService,);


  Future<WebServiceResponse?> loginRequest(LoginRequest request) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.GET_LIKED_POSTS ,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

}