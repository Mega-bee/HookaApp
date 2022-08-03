// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i14;
import '../auth/HiveSetUp.dart' as _i4;
import '../auth/repository/login_repository.dart' as _i10;
import '../auth/service/auth_service.dart' as _i5;
import '../auth/state_manager/login_state_manager.dart' as _i12;
import '../auth/ui/screens/login_screen.dart' as _i13;
import '../localization_service/localizationSservice.dart' as _i6;
import '../main.dart' as _i15;
import '../module_network/http_client/http_client.dart' as _i9;
import '../splash_screen/splash_module.dart' as _i11;
import '../splash_screen/ui/splash_screen.dart' as _i8;
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
  gh.factory<_i8.SplashScreen>(() => _i8.SplashScreen());
  gh.factory<_i9.ApiClient>(() => _i9.ApiClient(get<_i7.Logger>()));
  gh.factory<_i10.LoginRepository>(
      () => _i10.LoginRepository(get<_i9.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i11.SplashModule>(
      () => _i11.SplashModule(get<_i8.SplashScreen>()));
  gh.factory<_i12.LoginCubit>(
      () => _i12.LoginCubit(get<_i10.LoginRepository>()));
  gh.factory<_i13.loginScreen>(
      () => _i13.loginScreen(cubit: get<_i12.LoginCubit>()));
  gh.factory<_i14.AuthModule>(() => _i14.AuthModule(get<_i13.loginScreen>()));
  gh.factory<_i15.MyApp>(() => _i15.MyApp(get<_i6.LocalizationService>(),
      get<_i14.AuthModule>(), get<_i11.SplashModule>()));
  return get;
}
