import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/hooka_buddies/request/invite_request.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

import '../request/setting_request.dart';



@injectable
class SettingRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  SettingRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> Availble(SettingRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.put(
      Urls.BUDDIES,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}