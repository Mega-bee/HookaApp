import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';




@injectable
class ProfileRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  ProfileRepository(this._apiClient,this._authService);

  Future<WebServiceResponse?> getProfile() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.PROFILE,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }




}