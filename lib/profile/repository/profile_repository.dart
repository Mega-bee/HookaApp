import 'package:hooka/abstracts/WebUrl.dart';
import 'package:hooka/abstracts/model/WebServiceResponse.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/module_network/http_client/http_client.dart';
import 'package:hooka/profile/request/add_adress.dart';
import 'package:hooka/profile/request/add_experience_request.dart';
import 'package:hooka/profile/request/delete_address_request.dart';
import 'package:hooka/profile/request/delete_education_request.dart';
import 'package:hooka/profile/request/delete_experience_request.dart';
import 'package:hooka/profile/request/update_profile_request.dart';
import 'package:injectable/injectable.dart';

import '../request/add_education_request.dart';




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
  Future<WebServiceResponse?> AddEducation(AddEducationRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.ADD_EDUCATION,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> AddExperience(AddExperienceRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.ADD_EXPERIENCE,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> AddAddressrepo(AddAddressRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.ADD_ADDRESS,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> UpdateProfile(UpdateProfileRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.UPDATE_PROFILE,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> DeleteAddress(DeleteAddressRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.DELETE_ADDRESSS,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> DeleteEducation(DeleteEducationRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.delete(
      Urls.DELETE_EDUCATION,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
  Future<WebServiceResponse?> DeleteEXPERIENCE(DeleteExperienceRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.delete(
      Urls.DELETE_EXPERIENCE,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> DeletetAccount(String id) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.DELETE_ACCOUNT + '${id}',
      {},
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }





}