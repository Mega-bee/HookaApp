import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/request/gen_otp_request.dart';
import 'package:hooka/auth/request/login_request.dart';
import 'package:hooka/auth/request/signup_request.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

import '../request/confirm_otp_request.dart';

@injectable
class LoginRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  LoginRepository(this._apiClient, this._authService,);


  Future<WebServiceResponse?> loginRequest(LogRequest request) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.LOGIN ,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> SignUpRequest(SignRequest request) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.SIGNUP ,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> GenerateOtpRequest(GenOtpRequest request) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.GENERATE_OTP ,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> ConfirmOtpRequest(ConfOtpRequest request) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CONFIRM_OTP ,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }


}