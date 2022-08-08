// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i34;
import '../auth/HiveSetUp.dart' as _i5;
import '../auth/repository/login_repository.dart' as _i16;
import '../auth/service/auth_service.dart' as _i6;
import '../auth/state_manager/login_state_manager.dart' as _i27;
import '../auth/state_manager/otp_state_screen.dart' as _i18;
import '../auth/state_manager/signup_state_manager.dart' as _i22;
import '../auth/ui/screens/login_screen.dart' as _i33;
import '../auth/ui/screens/otp_screen.dart' as _i19;
import '../auth/ui/screens/signup_screen.dart' as _i23;
import '../home_page/home_module.dart' as _i8;
import '../home_page/ui/screens/drawer_screen.dart' as _i7;
import '../home_page/ui/screens/home_screen.dart' as _i9;
import '../hooka_buddies/buddies_module.dart' as _i36;
import '../hooka_buddies/repository/buddies_repository.dart' as _i15;
import '../hooka_buddies/state_manager/Buddies_state_manager.dart' as _i25;
import '../hooka_buddies/ui/screens/buddies.dart' as _i35;
import '../hooka_places/places_module.dart' as _i40;
import '../hooka_places/repository/places_repository.dart' as _i20;
import '../hooka_places/state_manager/details_state_manager.dart' as _i26;
import '../hooka_places/state_manager/places_state_manager.dart' as _i31;
import '../hooka_places/ui/screen/hooka_places.dart' as _i37;
import '../hooka_places/ui/screen/places_details.dart' as _i32;
import '../localization_service/localizationSservice.dart' as _i10;
import '../main.dart' as _i41;
import '../module_network/http_client/http_client.dart' as _i14;
import '../offers/offers_module.dart' as _i39;
import '../offers/repository/offers_repository.dart' as _i17;
import '../offers/state_manager/offers_details_state_manager.dart' as _i29;
import '../offers/state_manager/offers_state_manager.dart' as _i28;
import '../offers/widget/screen/offers.dart' as _i38;
import '../offers/widget/screen/offers_details_screens.dart' as _i30;
import '../settings/setting_module.dart' as _i21;
import '../settings/ui/about.dart' as _i3;
import '../settings/ui/settings.dart' as _i12;
import '../splash_screen/splash_module.dart' as _i24;
import '../splash_screen/ui/splash_screen.dart' as _i13;
import '../utils/logger/logger.dart' as _i11;
import '../utils/service/theme_serrvice/theme_service.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.About>(() => _i3.About());
  gh.factory<_i4.AppThemeDataService>(() => _i4.AppThemeDataService());
  gh.factory<_i5.AuthPrefsHelper>(() => _i5.AuthPrefsHelper());
  gh.factory<_i6.AuthService>(
      () => _i6.AuthService(get<_i5.AuthPrefsHelper>()));
  gh.factory<_i7.DrawerScreen>(() => _i7.DrawerScreen());
  gh.factory<_i8.HomeModule>(() => _i8.HomeModule(get<_i7.DrawerScreen>()));
  gh.factory<_i9.HomeScreen>(() => _i9.HomeScreen());
  gh.factory<_i10.LocalizationService>(() => _i10.LocalizationService());
  gh.factory<_i11.Logger>(() => _i11.Logger());
  gh.factory<_i12.Settings>(() => _i12.Settings());
  gh.factory<_i13.SplashScreen>(
      () => _i13.SplashScreen(get<_i6.AuthService>()));
  gh.factory<_i14.ApiClient>(() => _i14.ApiClient(get<_i11.Logger>()));
  gh.factory<_i15.BuddiesRepository>(() =>
      _i15.BuddiesRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i16.LoginRepository>(() =>
      _i16.LoginRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i17.OffersRepository>(() =>
      _i17.OffersRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i18.OtpCubit>(() => _i18.OtpCubit(get<_i16.LoginRepository>()));
  gh.factory<_i19.PinCodeVerificationScreen>(
      () => _i19.PinCodeVerificationScreen(get<_i18.OtpCubit>()));
  gh.factory<_i20.PlacesRepository>(() =>
      _i20.PlacesRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i21.SettingModule>(
      () => _i21.SettingModule(get<_i12.Settings>(), get<_i3.About>()));
  gh.factory<_i22.SignUpCubit>(
      () => _i22.SignUpCubit(get<_i16.LoginRepository>()));
  gh.factory<_i23.SignupScreen>(
      () => _i23.SignupScreen(cubit: get<_i22.SignUpCubit>()));
  gh.factory<_i24.SplashModule>(
      () => _i24.SplashModule(get<_i13.SplashScreen>()));
  gh.factory<_i25.BuddiesCubit>(() =>
      _i25.BuddiesCubit(get<_i15.BuddiesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i26.DetailsCubit>(() =>
      _i26.DetailsCubit(get<_i20.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i27.LoginCubit>(() =>
      _i27.LoginCubit(get<_i16.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i28.OffersCubit>(() =>
      _i28.OffersCubit(get<_i17.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i29.OffersDetailsCubit>(() => _i29.OffersDetailsCubit(
      get<_i17.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i30.OffersDetailsScreen>(
      () => _i30.OffersDetailsScreen(get<_i29.OffersDetailsCubit>()));
  gh.factory<_i31.PlacesCubit>(() =>
      _i31.PlacesCubit(get<_i20.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i32.PlacesDetails>(
      () => _i32.PlacesDetails(get<_i26.DetailsCubit>()));
  gh.factory<_i33.loginScreen>(
      () => _i33.loginScreen(cubit: get<_i27.LoginCubit>()));
  gh.factory<_i34.AuthModule>(() => _i34.AuthModule(get<_i33.loginScreen>(),
      get<_i23.SignupScreen>(), get<_i19.PinCodeVerificationScreen>()));
  gh.factory<_i35.Buddies>(() => _i35.Buddies(get<_i25.BuddiesCubit>()));
  gh.factory<_i36.BuddiesModule>(() => _i36.BuddiesModule(get<_i35.Buddies>()));
  gh.factory<_i37.HookaPlaces>(() => _i37.HookaPlaces(get<_i31.PlacesCubit>()));
  gh.factory<_i38.Offers>(() => _i38.Offers(get<_i28.OffersCubit>()));
  gh.factory<_i39.OffersModule>(() =>
      _i39.OffersModule(get<_i38.Offers>(), get<_i30.OffersDetailsScreen>()));
  gh.factory<_i40.PlacesModule>(() =>
      _i40.PlacesModule(get<_i37.HookaPlaces>(), get<_i32.PlacesDetails>()));
  gh.factory<_i41.MyApp>(() => _i41.MyApp(
      get<_i10.LocalizationService>(),
      get<_i34.AuthModule>(),
      get<_i24.SplashModule>(),
      get<_i8.HomeModule>(),
      get<_i40.PlacesModule>(),
      get<_i36.BuddiesModule>(),
      get<_i39.OffersModule>(),
      get<_i21.SettingModule>()));
  return get;
}
