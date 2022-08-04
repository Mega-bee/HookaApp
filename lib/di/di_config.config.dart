// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i21;
import '../auth/HiveSetUp.dart' as _i4;
import '../auth/otp_module.dart' as _i19;
import '../auth/repository/login_repository.dart' as _i12;
import '../auth/service/auth_service.dart' as _i5;
import '../auth/state_manager/login_state_manager.dart' as _i18;
import '../auth/state_manager/otp_state_screen.dart' as _i13;
import '../auth/state_manager/signup_state_manager.dart' as _i15;
import '../auth/ui/screens/login_screen.dart' as _i20;
import '../auth/ui/screens/otp_screen.dart' as _i14;
import '../auth/ui/screens/signup_screen.dart' as _i16;
import '../home_page/home_module.dart' as _i11;
import '../home_page/ui/screens/main_screen.dart' as _i8;
import '../localization_service/localizationSservice.dart' as _i6;
import '../main.dart' as _i22;
import '../module_network/http_client/http_client.dart' as _i10;
import '../splash_screen/splash_module.dart' as _i17;
import '../splash_screen/ui/splash_screen.dart' as _i9;
import '../utils/logger/logger.dart' as _i7;
import '../utils/service/theme_serrvice/theme_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppThemeDataService>(() => _i3.AppThemeDataService());
  gh.factory<_i4.AuthPrefsHelper>(() => _i4.AuthPrefsHelper());
  gh.factory<_i5.AuthService>(
      () => _i5.AuthService(get<_i4.AuthPrefsHelper>()));
  gh.factory<_i6.LocalizationService>(() => _i6.LocalizationService());
  gh.factory<_i7.Logger>(() => _i7.Logger());
  gh.factory<_i8.MainScreen>(() => _i8.MainScreen());
  gh.factory<_i9.SplashScreen>(() => _i9.SplashScreen());
  gh.factory<_i10.ApiClient>(() => _i10.ApiClient(get<_i7.Logger>()));
  gh.factory<_i11.HomeModule>(() => _i11.HomeModule(get<_i8.MainScreen>()));
  gh.factory<_i12.LoginRepository>(() =>
      _i12.LoginRepository(get<_i10.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i13.OtpCubit>(() => _i13.OtpCubit(get<_i12.LoginRepository>()));
  gh.factory<_i14.PinCodeVerificationScreen>(
      () => _i14.PinCodeVerificationScreen(get<_i13.OtpCubit>()));
  gh.factory<_i15.SignUpCubit>(
      () => _i15.SignUpCubit(get<_i12.LoginRepository>()));
  gh.factory<_i16.SignupScreen>(
      () => _i16.SignupScreen(cubit: get<_i15.SignUpCubit>()));
  gh.factory<_i17.SplashModule>(
      () => _i17.SplashModule(get<_i9.SplashScreen>()));
  gh.factory<_i18.LoginCubit>(() =>
      _i18.LoginCubit(get<_i12.LoginRepository>(), get<_i5.AuthService>()));
  gh.factory<_i19.OtpModule>(
      () => _i19.OtpModule(get<_i14.PinCodeVerificationScreen>()));
  gh.factory<_i20.loginScreen>(
      () => _i20.loginScreen(cubit: get<_i18.LoginCubit>()));
  gh.factory<_i21.AuthModule>(
      () => _i21.AuthModule(get<_i20.loginScreen>(), get<_i16.SignupScreen>()));
  gh.factory<_i22.MyApp>(() => _i22.MyApp(
      get<_i6.LocalizationService>(),
      get<_i21.AuthModule>(),
      get<_i17.SplashModule>(),
      get<_i11.HomeModule>(),
      get<_i19.OtpModule>()));
  return get;
}
