import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';



@injectable
class OffersRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  OffersRepository(this._apiClient,this._authService);

  Future<WebServiceResponse?> getOffers() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.OFFERS,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> getOffDetails(String? id) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.OFFERS_DETAILS +"$id",
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }


}