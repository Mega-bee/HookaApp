// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i40;
import '../auth/HiveSetUp.dart' as _i5;
import '../auth/repository/login_repository.dart' as _i18;
import '../auth/service/auth_service.dart' as _i6;
import '../auth/state_manager/login_state_manager.dart' as _i33;
import '../auth/state_manager/otp_state_screen.dart' as _i20;
import '../auth/state_manager/signup_state_manager.dart' as _i28;
import '../auth/ui/screens/login_screen.dart' as _i39;
import '../auth/ui/screens/otp_screen.dart' as _i21;
import '../auth/ui/screens/signup_screen.dart' as _i29;
import '../home_page/home_module.dart' as _i8;
import '../home_page/ui/screens/drawer_screen.dart' as _i7;
import '../home_page/ui/screens/home_screen.dart' as _i9;
import '../hooka_buddies/buddies_module.dart' as _i42;
import '../hooka_buddies/repository/buddies_repository.dart' as _i16;
import '../hooka_buddies/state_manager/Buddies_state_manager.dart' as _i31;
import '../hooka_buddies/ui/screens/buddies.dart' as _i41;
import '../hooka_places/places_module.dart' as _i46;
import '../hooka_places/repository/places_repository.dart' as _i22;
import '../hooka_places/state_manager/details_state_manager.dart' as _i32;
import '../hooka_places/state_manager/places_state_manager.dart' as _i37;
import '../hooka_places/ui/screen/hooka_places.dart' as _i43;
import '../hooka_places/ui/screen/places_details.dart' as _i38;
import '../invitations/repository/invitations_repository.dart' as _i17;
import '../invitations/state_manager/invitation_state_manager.dart' as _i23;
import '../invitations/state_manager/sent_state_manager.dart' as _i25;
import '../invitations/ui/screen/invitations.dart' as _i10;
import '../invitations/ui/screen/received_tab.dart' as _i24;
import '../invitations/ui/screen/sent_tab.dart' as _i26;
import '../localization_service/localizationSservice.dart' as _i11;
import '../main.dart' as _i47;
import '../module_network/http_client/http_client.dart' as _i15;
import '../offers/offers_module.dart' as _i45;
import '../offers/repository/offers_repository.dart' as _i19;
import '../offers/state_manager/offers_details_state_manager.dart' as _i35;
import '../offers/state_manager/offers_state_manager.dart' as _i34;
import '../offers/widget/screen/offers.dart' as _i44;
import '../offers/widget/screen/offers_details_screens.dart' as _i36;
import '../settings/setting_module.dart' as _i27;
import '../settings/ui/about.dart' as _i3;
import '../settings/ui/settings.dart' as _i13;
import '../splash_screen/splash_module.dart' as _i30;
import '../splash_screen/ui/splash_screen.dart' as _i14;
import '../utils/logger/logger.dart' as _i12;
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
  gh.factory<_i10.Invitations>(() => _i10.Invitations());
  gh.factory<_i11.LocalizationService>(() => _i11.LocalizationService());
  gh.factory<_i12.Logger>(() => _i12.Logger());
  gh.factory<_i13.Settings>(() => _i13.Settings());
  gh.factory<_i14.SplashScreen>(
      () => _i14.SplashScreen(get<_i6.AuthService>()));
  gh.factory<_i15.ApiClient>(() => _i15.ApiClient(get<_i12.Logger>()));
  gh.factory<_i16.BuddiesRepository>(() =>
      _i16.BuddiesRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i17.InvitationsRepository>(() => _i17.InvitationsRepository(
      get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i18.LoginRepository>(() =>
      _i18.LoginRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i19.OffersRepository>(() =>
      _i19.OffersRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i20.OtpCubit>(() => _i20.OtpCubit(get<_i18.LoginRepository>()));
  gh.factory<_i21.PinCodeVerificationScreen>(
      () => _i21.PinCodeVerificationScreen(get<_i20.OtpCubit>()));
  gh.factory<_i22.PlacesRepository>(() =>
      _i22.PlacesRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i23.RecInvitationCubit>(() => _i23.RecInvitationCubit(
      get<_i17.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i24.ReceivedTab>(
      () => _i24.ReceivedTab(get<_i23.RecInvitationCubit>()));
  gh.factory<_i25.SentInvitationCubit>(() => _i25.SentInvitationCubit(
      get<_i17.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i26.SentTab>(() => _i26.SentTab(get<_i25.SentInvitationCubit>()));
  gh.factory<_i27.SettingModule>(
      () => _i27.SettingModule(get<_i13.Settings>(), get<_i3.About>()));
  gh.factory<_i28.SignUpCubit>(
      () => _i28.SignUpCubit(get<_i18.LoginRepository>()));
  gh.factory<_i29.SignupScreen>(
      () => _i29.SignupScreen(cubit: get<_i28.SignUpCubit>()));
  gh.factory<_i30.SplashModule>(
      () => _i30.SplashModule(get<_i14.SplashScreen>()));
  gh.factory<_i31.BuddiesCubit>(() =>
      _i31.BuddiesCubit(get<_i16.BuddiesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i32.DetailsCubit>(() =>
      _i32.DetailsCubit(get<_i22.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i33.LoginCubit>(() =>
      _i33.LoginCubit(get<_i18.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i34.OffersCubit>(() =>
      _i34.OffersCubit(get<_i19.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i35.OffersDetailsCubit>(() => _i35.OffersDetailsCubit(
      get<_i19.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i36.OffersDetailsScreen>(
      () => _i36.OffersDetailsScreen(get<_i35.OffersDetailsCubit>()));
  gh.factory<_i37.PlacesCubit>(() =>
      _i37.PlacesCubit(get<_i22.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i38.PlacesDetails>(
      () => _i38.PlacesDetails(get<_i32.DetailsCubit>()));
  gh.factory<_i39.loginScreen>(
      () => _i39.loginScreen(cubit: get<_i33.LoginCubit>()));
  gh.factory<_i40.AuthModule>(() => _i40.AuthModule(get<_i39.loginScreen>(),
      get<_i29.SignupScreen>(), get<_i21.PinCodeVerificationScreen>()));
  gh.factory<_i41.Buddies>(() => _i41.Buddies(get<_i31.BuddiesCubit>()));
  gh.factory<_i42.BuddiesModule>(() => _i42.BuddiesModule(get<_i41.Buddies>()));
  gh.factory<_i43.HookaPlaces>(() => _i43.HookaPlaces(get<_i37.PlacesCubit>()));
  gh.factory<_i44.Offers>(() => _i44.Offers(get<_i34.OffersCubit>()));
  gh.factory<_i45.OffersModule>(() =>
      _i45.OffersModule(get<_i44.Offers>(), get<_i36.OffersDetailsScreen>()));
  gh.factory<_i46.PlacesModule>(() =>
      _i46.PlacesModule(get<_i43.HookaPlaces>(), get<_i38.PlacesDetails>()));
  gh.factory<_i47.MyApp>(() => _i47.MyApp(
      get<_i11.LocalizationService>(),
      get<_i40.AuthModule>(),
      get<_i30.SplashModule>(),
      get<_i8.HomeModule>(),
      get<_i46.PlacesModule>(),
      get<_i42.BuddiesModule>(),
      get<_i45.OffersModule>(),
      get<_i27.SettingModule>()));
  return get;
}
