import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/request/gen_otp_request.dart';
import 'package:hooka/auth/request/login_request.dart';
import 'package:hooka/auth/request/signup_request.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/hooka_places/request/isfav_request.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';




@injectable
class ProductsRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  ProductsRepository(this._apiClient,this._authService);

  Future<WebServiceResponse?> getProduct() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_ALL_PRODUCT,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> getDetailsProd(String? id) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.DETAILS_PRODUCT +"$id",
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }



}