import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/hooka_buddies/request/invite_request.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

import '../request/address_request.dart';



@injectable
class AddressRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  AddressRepository(this._apiClient, this._authService);


  Future<WebServiceResponse?> getAddresses() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_ADDRESS,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> makeOrder(OrderRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.PLACE_ORDER,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}