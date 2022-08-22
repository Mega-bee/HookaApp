import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/contact_us/repository/contact_us_repository.dart';
import 'package:hooka/contact_us/request/contactus_request.dart';
import 'package:injectable/injectable.dart';
import '../ui/contactus.dart';



@injectable
class ContactUsCubit extends Cubit<States> {
  final ContactUsRepository _contactUsRepository;
  final AuthService _authService;


  ContactUsCubit(this._contactUsRepository, this._authService,) : super(LoadingState());




  ContactUs(
      ScreenContactusState screenState,ContactUsRequest request) {
    _contactUsRepository.ContactUsRepo(request).then((value) {
      if (value!.code == 200) {

      }
    });

  }}