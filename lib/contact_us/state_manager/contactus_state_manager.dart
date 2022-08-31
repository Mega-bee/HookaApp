import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/abstracts/states/loading_state.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/service/auth_service.dart';
import 'package:hooka/contact_us/repository/contact_us_repository.dart';
import 'package:hooka/contact_us/request/contactus_request.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../ui/screen/contactus.dart';

@injectable
class ContactUsCubit extends Cubit<States> {
  final ContactUsRepository _contactUsRepository;
  final AuthService _authService;

  ContactUsCubit(
    this._contactUsRepository,
    this._authService,
  ) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  ContactUs(ScreenContactusState screenState, ContactUsRequest request) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _contactUsRepository.ContactUsRepo(request).then((value) {
      if (value!.code == 200) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Your message sent successfully');
      }
    });
  }
}
