// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i56;
import '../auth/HiveSetUp.dart' as _i5;
import '../auth/repository/login_repository.dart' as _i19;
import '../auth/service/auth_service.dart' as _i6;
import '../auth/state_manager/login_state_manager.dart' as _i45;
import '../auth/state_manager/otp_state_screen.dart' as _i21;
import '../auth/state_manager/signup_state_manager.dart' as _i33;
import '../auth/ui/screens/login_screen.dart' as _i55;
import '../auth/ui/screens/otp_screen.dart' as _i22;
import '../auth/ui/screens/signup_screen.dart' as _i34;
import '../home_page/home_module.dart' as _i8;
import '../home_page/ui/screens/drawer_screen.dart' as _i7;
import '../home_page/ui/screens/home_screen.dart' as _i9;
import '../Hooka%20Basket/basket_module.dart' as _i57;
import '../Hooka%20Basket/repository/basket_repository.dart' as _i16;
import '../Hooka%20Basket/state_manager/basket_state_manager.dart' as _i37;
import '../Hooka%20Basket/ui/screen/basket_screen.dart' as _i38;
import '../hooka_buddies/buddies_module.dart' as _i59;
import '../hooka_buddies/repository/buddies_repository.dart' as _i17;
import '../hooka_buddies/state_manager/buddies_profile_state_manager.dart'
    as _i25;
import '../hooka_buddies/state_manager/Buddies_state_manager.dart' as _i39;
import '../hooka_buddies/ui/screens/buddies.dart' as _i58;
import '../hooka_buddies/ui/screens/invite.dart' as _i44;
import '../hooka_buddies/ui/screens/view_profile.dart' as _i36;
import '../hooka_places/places_module.dart' as _i65;
import '../hooka_places/repository/places_repository.dart' as _i23;
import '../hooka_places/state_manager/details_state_manager.dart' as _i40;
import '../hooka_places/state_manager/places_state_manager.dart' as _i49;
import '../hooka_places/ui/screen/hooka_places.dart' as _i62;
import '../hooka_places/ui/screen/places_details.dart' as _i50;
import '../hooka_product/product_module.dart' as _i66;
import '../hooka_product/repository/product_repository.dart' as _i24;
import '../hooka_product/state_manager/detailsprod_state_manager.dart' as _i51;
import '../hooka_product/state_manager/getproduct_state_manager.dart' as _i41;
import '../hooka_product/ui/screen/hooka_product.dart' as _i43;
import '../hooka_product/ui/screen/prod_details.dart' as _i61;
import '../invitations/details_module.dart' as _i60;
import '../invitations/repository/invitations_repository.dart' as _i18;
import '../invitations/state_manager/invitation_state_manager.dart' as _i27;
import '../invitations/state_manager/sent_state_manager.dart' as _i29;
import '../invitations/ui/screen/invitations.dart' as _i10;
import '../invitations/ui/screen/received_tab.dart' as _i28;
import '../invitations/ui/screen/sent_details.dart' as _i54;
import '../invitations/ui/screen/sent_tab.dart' as _i30;
import '../localization_service/localizationSservice.dart' as _i11;
import '../main.dart' as _i67;
import '../module_network/http_client/http_client.dart' as _i15;
import '../offers/offers_module.dart' as _i64;
import '../offers/repository/offers_repository.dart' as _i20;
import '../offers/state_manager/offers_details_state_manager.dart' as _i47;
import '../offers/state_manager/offers_state_manager.dart' as _i46;
import '../offers/widget/screen/offers.dart' as _i63;
import '../offers/widget/screen/offers_details_screens.dart' as _i48;
import '../profile/profile_module.dart' as _i53;
import '../profile/repository/profile_repository.dart' as _i26;
import '../profile/state_manager/profile_state_manager.dart' as _i42;
import '../profile/ui/screens/profile.dart' as _i52;
import '../settings/repository/setting_repository.dart' as _i32;
import '../settings/setting_module.dart' as _i31;
import '../settings/ui/about.dart' as _i3;
import '../settings/ui/settings.dart' as _i13;
import '../splash_screen/splash_module.dart' as _i35;
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
  gh.factory<_i7.DrawerScreen>(() => _i7.DrawerScreen(get<_i6.AuthService>()));
  gh.factory<_i8.HomeModule>(() => _i8.HomeModule(get<_i7.DrawerScreen>()));
  gh.factory<_i9.HomeScreen>(() => _i9.HomeScreen());
  gh.factory<_i10.Invitations>(() => _i10.Invitations());
  gh.factory<_i11.LocalizationService>(() => _i11.LocalizationService());
  gh.factory<_i12.Logger>(() => _i12.Logger());
  gh.factory<_i13.Settings>(() => _i13.Settings());
  gh.factory<_i14.SplashScreen>(
      () => _i14.SplashScreen(get<_i6.AuthService>()));
  gh.factory<_i15.ApiClient>(() => _i15.ApiClient(get<_i12.Logger>()));
  gh.factory<_i16.BasketRepository>(() =>
      _i16.BasketRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i17.BuddiesRepository>(() =>
      _i17.BuddiesRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i18.InvitationsRepository>(() => _i18.InvitationsRepository(
      get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i19.LoginRepository>(() =>
      _i19.LoginRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i20.OffersRepository>(() =>
      _i20.OffersRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i21.OtpCubit>(
      () => _i21.OtpCubit(get<_i19.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i22.PinCodeVerificationScreen>(
      () => _i22.PinCodeVerificationScreen(get<_i21.OtpCubit>()));
  gh.factory<_i23.PlacesRepository>(() =>
      _i23.PlacesRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i24.ProductsRepository>(() =>
      _i24.ProductsRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i25.ProfileBuddiesCubit>(() => _i25.ProfileBuddiesCubit(
      get<_i17.BuddiesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i26.ProfileRepository>(() =>
      _i26.ProfileRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i27.RecInvitationCubit>(() => _i27.RecInvitationCubit(
      get<_i18.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i28.ReceivedTab>(
      () => _i28.ReceivedTab(get<_i27.RecInvitationCubit>()));
  gh.factory<_i29.SentInvitationCubit>(() => _i29.SentInvitationCubit(
      get<_i18.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i30.SentTab>(() => _i30.SentTab(get<_i29.SentInvitationCubit>()));
  gh.factory<_i31.SettingModule>(
      () => _i31.SettingModule(get<_i13.Settings>(), get<_i3.About>()));
  gh.factory<_i32.SettingRepository>(() =>
      _i32.SettingRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i33.SignUpCubit>(
      () => _i33.SignUpCubit(get<_i19.LoginRepository>()));
  gh.factory<_i34.SignupScreen>(
      () => _i34.SignupScreen(cubit: get<_i33.SignUpCubit>()));
  gh.factory<_i35.SplashModule>(
      () => _i35.SplashModule(get<_i14.SplashScreen>()));
  gh.factory<_i36.ViewProfileBuddie>(
      () => _i36.ViewProfileBuddie(get<_i25.ProfileBuddiesCubit>()));
  gh.factory<_i37.BasketCubit>(() =>
      _i37.BasketCubit(get<_i16.BasketRepository>(), get<_i6.AuthService>()));
  gh.factory<_i38.BasketScreen>(
      () => _i38.BasketScreen(get<_i37.BasketCubit>()));
  gh.factory<_i39.BuddiesCubit>(() => _i39.BuddiesCubit(
      get<_i17.BuddiesRepository>(), get<_i23.PlacesRepository>()));
  gh.factory<_i40.DetailsCubit>(() =>
      _i40.DetailsCubit(get<_i23.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i41.GetProductCubit>(() => _i41.GetProductCubit(
      get<_i24.ProductsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i42.GetProfileCubit>(() => _i42.GetProfileCubit(
      get<_i26.ProfileRepository>(), get<_i6.AuthService>()));
  gh.factory<_i43.HookaProduct>(
      () => _i43.HookaProduct(get<_i41.GetProductCubit>()));
  gh.factory<_i44.InviteBuddies>(
      () => _i44.InviteBuddies(get<_i39.BuddiesCubit>()));
  gh.factory<_i45.LoginCubit>(() =>
      _i45.LoginCubit(get<_i19.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i46.OffersCubit>(() =>
      _i46.OffersCubit(get<_i20.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i47.OffersDetailsCubit>(() => _i47.OffersDetailsCubit(
      get<_i20.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i48.OffersDetailsScreen>(
      () => _i48.OffersDetailsScreen(get<_i47.OffersDetailsCubit>()));
  gh.factory<_i49.PlacesCubit>(() =>
      _i49.PlacesCubit(get<_i23.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i50.PlacesDetails>(
      () => _i50.PlacesDetails(get<_i40.DetailsCubit>()));
  gh.factory<_i51.ProdDetailsCubit>(() => _i51.ProdDetailsCubit(
      get<_i24.ProductsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i52.Profile>(() => _i52.Profile(get<_i42.GetProfileCubit>()));
  gh.factory<_i53.ProfileModule>(() => _i53.ProfileModule(get<_i52.Profile>()));
  gh.factory<_i54.SentDetails>(
      () => _i54.SentDetails(get<_i29.SentInvitationCubit>()));
  gh.factory<_i55.loginScreen>(
      () => _i55.loginScreen(cubit: get<_i45.LoginCubit>()));
  gh.factory<_i56.AuthModule>(() => _i56.AuthModule(get<_i55.loginScreen>(),
      get<_i34.SignupScreen>(), get<_i22.PinCodeVerificationScreen>()));
  gh.factory<_i57.BasketModule>(
      () => _i57.BasketModule(get<_i38.BasketScreen>()));
  gh.factory<_i58.Buddies>(() => _i58.Buddies(get<_i39.BuddiesCubit>()));
  gh.factory<_i59.BuddiesModule>(() => _i59.BuddiesModule(get<_i58.Buddies>(),
      get<_i44.InviteBuddies>(), get<_i36.ViewProfileBuddie>()));
  gh.factory<_i60.DetailsInvModule>(
      () => _i60.DetailsInvModule(get<_i54.SentDetails>()));
  gh.factory<_i61.DetailsProduct>(
      () => _i61.DetailsProduct(get<_i51.ProdDetailsCubit>()));
  gh.factory<_i62.HookaPlaces>(() => _i62.HookaPlaces(get<_i49.PlacesCubit>()));
  gh.factory<_i63.Offers>(() => _i63.Offers(get<_i46.OffersCubit>()));
  gh.factory<_i64.OffersModule>(() =>
      _i64.OffersModule(get<_i63.Offers>(), get<_i48.OffersDetailsScreen>()));
  gh.factory<_i65.PlacesModule>(() =>
      _i65.PlacesModule(get<_i62.HookaPlaces>(), get<_i50.PlacesDetails>()));
  gh.factory<_i66.ProductModule>(() =>
      _i66.ProductModule(get<_i43.HookaProduct>(), get<_i61.DetailsProduct>()));
  gh.factory<_i67.MyApp>(() => _i67.MyApp(
      get<_i11.LocalizationService>(),
      get<_i56.AuthModule>(),
      get<_i35.SplashModule>(),
      get<_i8.HomeModule>(),
      get<_i65.PlacesModule>(),
      get<_i59.BuddiesModule>(),
      get<_i64.OffersModule>(),
      get<_i31.SettingModule>(),
      get<_i66.ProductModule>(),
      get<_i53.ProfileModule>(),
      get<_i60.DetailsInvModule>(),
      get<_i57.BasketModule>()));
  return get;
}
