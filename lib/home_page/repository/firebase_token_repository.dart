import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/home_page/request/firebase_request.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';



@injectable
class FireBaseRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  FireBaseRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> FireBaseNotification(FireRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.put(
      Urls.FIRE_TOKEN,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

}