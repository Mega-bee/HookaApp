import 'dart:io' as plat;
import 'package:hooka/auth/HiveSetUp.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
@injectable
class LocalizationService {
  static final PublishSubject<String> _localizationSubject =
  PublishSubject<String>();

  Stream<String> get localizationStream => _localizationSubject.stream;

  LocalizationService();

  final LanguageHelper _languageHelper = LanguageHelper();


  void setLanguage(String lang) {
    _languageHelper.setLanguage(lang);
    _localizationSubject.add(lang);
  }

  String getLanguage() {
    String? lang = _languageHelper.getLanguage();
    if (kIsWeb) {
      lang ??= 'en';
    } else {
      lang ??= plat.Platform.localeName.substring(0, 2);
    }
    return lang;
  }


}