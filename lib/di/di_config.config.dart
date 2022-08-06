// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i26;
import '../auth/HiveSetUp.dart' as _i4;
import '../auth/repository/login_repository.dart' as _i13;
import '../auth/service/auth_service.dart' as _i5;
import '../auth/state_manager/login_state_manager.dart' as _i22;
import '../auth/state_manager/otp_state_screen.dart' as _i14;
import '../auth/state_manager/signup_state_manager.dart' as _i17;
import '../auth/ui/screens/login_screen.dart' as _i25;
import '../auth/ui/screens/otp_screen.dart' as _i15;
import '../auth/ui/screens/signup_screen.dart' as _i18;
import '../home_page/home_module.dart' as _i12;
import '../home_page/ui/screens/main_screen.dart' as _i8;
import '../hooka_buddies/buddies_module.dart' as _i28;
import '../hooka_buddies/repository/buddies_repository.dart' as _i11;
import '../hooka_buddies/state_manager/Buddies_state_manager.dart' as _i20;
import '../hooka_buddies/ui/screens/buddies.dart' as _i27;
import '../hooka_places/places_module.dart' as _i30;
import '../hooka_places/repository/places_repository.dart' as _i16;
import '../hooka_places/state_manager/details_state_manager.dart' as _i21;
import '../hooka_places/state_manager/places_state_manager.dart' as _i23;
import '../hooka_places/ui/screen/hooka_places.dart' as _i29;
import '../hooka_places/ui/screen/places_details.dart' as _i24;
import '../localization_service/localizationSservice.dart' as _i6;
import '../main.dart' as _i31;
import '../module_network/http_client/http_client.dart' as _i10;
import '../splash_screen/splash_module.dart' as _i19;
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
  gh.factory<_i11.BuddiesRepository>(() =>
      _i11.BuddiesRepository(get<_i10.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i12.HomeModule>(() => _i12.HomeModule(get<_i8.MainScreen>()));
  gh.factory<_i13.LoginRepository>(() =>
      _i13.LoginRepository(get<_i10.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i14.OtpCubit>(() => _i14.OtpCubit(get<_i13.LoginRepository>()));
  gh.factory<_i15.PinCodeVerificationScreen>(
      () => _i15.PinCodeVerificationScreen(get<_i14.OtpCubit>()));
  gh.factory<_i16.PlacesRepository>(() =>
      _i16.PlacesRepository(get<_i10.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i17.SignUpCubit>(
      () => _i17.SignUpCubit(get<_i13.LoginRepository>()));
  gh.factory<_i18.SignupScreen>(
      () => _i18.SignupScreen(cubit: get<_i17.SignUpCubit>()));
  gh.factory<_i19.SplashModule>(
      () => _i19.SplashModule(get<_i9.SplashScreen>()));
  gh.factory<_i20.BuddiesCubit>(() =>
      _i20.BuddiesCubit(get<_i11.BuddiesRepository>(), get<_i5.AuthService>()));
  gh.factory<_i21.DetailsCubit>(() =>
      _i21.DetailsCubit(get<_i16.PlacesRepository>(), get<_i5.AuthService>()));
  gh.factory<_i22.LoginCubit>(() =>
      _i22.LoginCubit(get<_i13.LoginRepository>(), get<_i5.AuthService>()));
  gh.factory<_i23.PlacesCubit>(() =>
      _i23.PlacesCubit(get<_i16.PlacesRepository>(), get<_i5.AuthService>()));
  gh.factory<_i24.PlacesDetails>(
      () => _i24.PlacesDetails(get<_i21.DetailsCubit>()));
  gh.factory<_i25.loginScreen>(
      () => _i25.loginScreen(cubit: get<_i22.LoginCubit>()));
  gh.factory<_i26.AuthModule>(() => _i26.AuthModule(get<_i25.loginScreen>(),
      get<_i18.SignupScreen>(), get<_i15.PinCodeVerificationScreen>()));
  gh.factory<_i27.Buddies>(() => _i27.Buddies(get<_i20.BuddiesCubit>()));
  gh.factory<_i28.BuddiesModule>(() => _i28.BuddiesModule(get<_i27.Buddies>()));
  gh.factory<_i29.HookaPlaces>(() => _i29.HookaPlaces(get<_i23.PlacesCubit>()));
  gh.factory<_i30.PlacesModule>(() =>
      _i30.PlacesModule(get<_i29.HookaPlaces>(), get<_i24.PlacesDetails>()));
  gh.factory<_i31.MyApp>(() => _i31.MyApp(
      get<_i6.LocalizationService>(),
      get<_i26.AuthModule>(),
      get<_i19.SplashModule>(),
      get<_i12.HomeModule>(),
      get<_i30.PlacesModule>(),
      get<_i28.BuddiesModule>()));
  return get;
}
