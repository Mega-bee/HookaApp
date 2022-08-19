// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i59;
import '../auth/HiveSetUp.dart' as _i5;
import '../auth/repository/login_repository.dart' as _i20;
import '../auth/service/auth_service.dart' as _i6;
import '../auth/state_manager/login_state_manager.dart' as _i46;
import '../auth/state_manager/otp_state_screen.dart' as _i22;
import '../auth/state_manager/signup_state_manager.dart' as _i33;
import '../auth/ui/screens/login_screen.dart' as _i58;
import '../auth/ui/screens/otp_screen.dart' as _i23;
import '../auth/ui/screens/signup_screen.dart' as _i34;
import '../checkout/checkout_module.dart' as _i64;
import '../checkout/repository/checkout_repository.dart' as _i18;
import '../checkout/state_manager/checkout_state_manager.dart' as _i40;
import '../checkout/ui/screen/checkout.dart' as _i63;
import '../home_page/home_module.dart' as _i9;
import '../home_page/ui/screens/drawer_screen.dart' as _i7;
import '../home_page/ui/screens/home_screen.dart' as _i10;
import '../Hooka%20Basket/basket_module.dart' as _i60;
import '../Hooka%20Basket/repository/basket_repository.dart' as _i16;
import '../Hooka%20Basket/state_manager/basket_state_manager.dart' as _i37;
import '../Hooka%20Basket/ui/screen/basket_screen.dart' as _i38;
import '../hooka_buddies/buddies_module.dart' as _i62;
import '../hooka_buddies/repository/buddies_repository.dart' as _i17;
import '../hooka_buddies/state_manager/buddies_profile_state_manager.dart'
    as _i26;
import '../hooka_buddies/state_manager/Buddies_state_manager.dart' as _i39;
import '../hooka_buddies/ui/screens/buddies.dart' as _i61;
import '../hooka_buddies/ui/screens/invite.dart' as _i45;
import '../hooka_buddies/ui/screens/view_profile.dart' as _i36;
import '../hooka_places/places_module.dart' as _i70;
import '../hooka_places/repository/places_repository.dart' as _i24;
import '../hooka_places/state_manager/details_state_manager.dart' as _i41;
import '../hooka_places/state_manager/places_state_manager.dart' as _i50;
import '../hooka_places/ui/screen/hooka_places.dart' as _i67;
import '../hooka_places/ui/screen/places_details.dart' as _i51;
import '../hooka_product/product_module.dart' as _i71;
import '../hooka_product/repository/product_repository.dart' as _i25;
import '../hooka_product/state_manager/detailsprod_state_manager.dart' as _i52;
import '../hooka_product/state_manager/getproduct_state_manager.dart' as _i42;
import '../hooka_product/ui/screen/hooka_product.dart' as _i44;
import '../hooka_product/ui/screen/prod_details.dart' as _i66;
import '../invitations/details_module.dart' as _i65;
import '../invitations/repository/invitations_repository.dart' as _i19;
import '../invitations/state_manager/invitation_state_manager.dart' as _i28;
import '../invitations/state_manager/sent_state_manager.dart' as _i30;
import '../invitations/ui/screen/invitations.dart' as _i11;
import '../invitations/ui/screen/received_tab.dart' as _i29;
import '../invitations/ui/screen/sent_details.dart' as _i55;
import '../invitations/ui/screen/sent_tab.dart' as _i31;
import '../localization_service/localizationSservice.dart' as _i12;
import '../main.dart' as _i73;
import '../module_network/http_client/http_client.dart' as _i15;
import '../offers/offers_module.dart' as _i69;
import '../offers/repository/offers_repository.dart' as _i21;
import '../offers/state_manager/offers_details_state_manager.dart' as _i48;
import '../offers/state_manager/offers_state_manager.dart' as _i47;
import '../offers/widget/screen/offers.dart' as _i68;
import '../offers/widget/screen/offers_details_screens.dart' as _i49;
import '../profile/profile_module.dart' as _i54;
import '../profile/repository/profile_repository.dart' as _i27;
import '../profile/state_manager/profile_state_manager.dart' as _i43;
import '../profile/ui/edit_profile.dart' as _i8;
import '../profile/ui/screens/profile.dart' as _i53;
import '../settings/repository/setting_repository.dart' as _i32;
import '../settings/setting_module.dart' as _i72;
import '../settings/state_manager/setting_state_manager.dart' as _i56;
import '../settings/ui/about.dart' as _i3;
import '../settings/ui/screen/settings.dart' as _i57;
import '../splash_screen/splash_module.dart' as _i35;
import '../splash_screen/ui/splash_screen.dart' as _i14;
import '../utils/logger/logger.dart' as _i13;
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
  gh.factory<_i8.EditProfile>(() => _i8.EditProfile());
  gh.factory<_i9.HomeModule>(() => _i9.HomeModule(get<_i7.DrawerScreen>()));
  gh.factory<_i10.HomeScreen>(() => _i10.HomeScreen());
  gh.factory<_i11.Invitations>(() => _i11.Invitations());
  gh.factory<_i12.LocalizationService>(() => _i12.LocalizationService());
  gh.factory<_i13.Logger>(() => _i13.Logger());
  gh.factory<_i14.SplashScreen>(
      () => _i14.SplashScreen(get<_i6.AuthService>()));
  gh.factory<_i15.ApiClient>(() => _i15.ApiClient(get<_i13.Logger>()));
  gh.factory<_i16.BasketRepository>(() =>
      _i16.BasketRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i17.BuddiesRepository>(() =>
      _i17.BuddiesRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i18.CheckoutRepository>(() =>
      _i18.CheckoutRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i19.InvitationsRepository>(() => _i19.InvitationsRepository(
      get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i20.LoginRepository>(() =>
      _i20.LoginRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i21.OffersRepository>(() =>
      _i21.OffersRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i22.OtpCubit>(
      () => _i22.OtpCubit(get<_i20.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i23.PinCodeVerificationScreen>(
      () => _i23.PinCodeVerificationScreen(get<_i22.OtpCubit>()));
  gh.factory<_i24.PlacesRepository>(() =>
      _i24.PlacesRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i25.ProductsRepository>(() =>
      _i25.ProductsRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i26.ProfileBuddiesCubit>(() => _i26.ProfileBuddiesCubit(
      get<_i17.BuddiesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i27.ProfileRepository>(() =>
      _i27.ProfileRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i28.RecInvitationCubit>(() => _i28.RecInvitationCubit(
      get<_i19.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i29.ReceivedTab>(
      () => _i29.ReceivedTab(get<_i28.RecInvitationCubit>()));
  gh.factory<_i30.SentInvitationCubit>(() => _i30.SentInvitationCubit(
      get<_i19.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i31.SentTab>(() => _i31.SentTab(get<_i30.SentInvitationCubit>()));
  gh.factory<_i32.SettingRepository>(() =>
      _i32.SettingRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i33.SignUpCubit>(
      () => _i33.SignUpCubit(get<_i20.LoginRepository>()));
  gh.factory<_i34.SignupScreen>(
      () => _i34.SignupScreen(cubit: get<_i33.SignUpCubit>()));
  gh.factory<_i35.SplashModule>(
      () => _i35.SplashModule(get<_i14.SplashScreen>()));
  gh.factory<_i36.ViewProfileBuddie>(
      () => _i36.ViewProfileBuddie(get<_i26.ProfileBuddiesCubit>()));
  gh.factory<_i37.BasketCubit>(() =>
      _i37.BasketCubit(get<_i16.BasketRepository>(), get<_i6.AuthService>()));
  gh.factory<_i38.BasketScreen>(
      () => _i38.BasketScreen(get<_i37.BasketCubit>()));
  gh.factory<_i39.BuddiesCubit>(() => _i39.BuddiesCubit(
      get<_i17.BuddiesRepository>(), get<_i24.PlacesRepository>()));
  gh.factory<_i40.CheckoutCubit>(() => _i40.CheckoutCubit(
      get<_i18.CheckoutRepository>(), get<_i6.AuthService>()));
  gh.factory<_i41.DetailsCubit>(() =>
      _i41.DetailsCubit(get<_i24.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i42.GetProductCubit>(() => _i42.GetProductCubit(
      get<_i25.ProductsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i43.GetProfileCubit>(() => _i43.GetProfileCubit(
      get<_i27.ProfileRepository>(), get<_i6.AuthService>()));
  gh.factory<_i44.HookaProduct>(
      () => _i44.HookaProduct(get<_i42.GetProductCubit>()));
  gh.factory<_i45.InviteBuddies>(
      () => _i45.InviteBuddies(get<_i39.BuddiesCubit>()));
  gh.factory<_i46.LoginCubit>(() =>
      _i46.LoginCubit(get<_i20.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i47.OffersCubit>(() =>
      _i47.OffersCubit(get<_i21.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i48.OffersDetailsCubit>(() => _i48.OffersDetailsCubit(
      get<_i21.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i49.OffersDetailsScreen>(
      () => _i49.OffersDetailsScreen(get<_i48.OffersDetailsCubit>()));
  gh.factory<_i50.PlacesCubit>(() =>
      _i50.PlacesCubit(get<_i24.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i51.PlacesDetails>(
      () => _i51.PlacesDetails(get<_i41.DetailsCubit>()));
  gh.factory<_i52.ProdDetailsCubit>(() => _i52.ProdDetailsCubit(
      get<_i25.ProductsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i53.Profile>(() => _i53.Profile(get<_i43.GetProfileCubit>()));
  gh.factory<_i54.ProfileModule>(
      () => _i54.ProfileModule(get<_i53.Profile>(), get<_i8.EditProfile>()));
  gh.factory<_i55.SentDetails>(
      () => _i55.SentDetails(get<_i30.SentInvitationCubit>()));
  gh.factory<_i56.SettingCubit>(() =>
      _i56.SettingCubit(get<_i32.SettingRepository>(), get<_i6.AuthService>()));
  gh.factory<_i57.Settings>(() => _i57.Settings(get<_i56.SettingCubit>()));
  gh.factory<_i58.loginScreen>(
      () => _i58.loginScreen(cubit: get<_i46.LoginCubit>()));
  gh.factory<_i59.AuthModule>(() => _i59.AuthModule(get<_i58.loginScreen>(),
      get<_i34.SignupScreen>(), get<_i23.PinCodeVerificationScreen>()));
  gh.factory<_i60.BasketModule>(
      () => _i60.BasketModule(get<_i38.BasketScreen>()));
  gh.factory<_i61.Buddies>(() => _i61.Buddies(get<_i39.BuddiesCubit>()));
  gh.factory<_i62.BuddiesModule>(() => _i62.BuddiesModule(get<_i61.Buddies>(),
      get<_i45.InviteBuddies>(), get<_i36.ViewProfileBuddie>()));
  gh.factory<_i63.Checkout>(() => _i63.Checkout(get<_i40.CheckoutCubit>()));
  gh.factory<_i64.CheckoutModule>(
      () => _i64.CheckoutModule(get<_i63.Checkout>()));
  gh.factory<_i65.DetailsInvModule>(
      () => _i65.DetailsInvModule(get<_i55.SentDetails>()));
  gh.factory<_i66.DetailsProduct>(
      () => _i66.DetailsProduct(get<_i52.ProdDetailsCubit>()));
  gh.factory<_i67.HookaPlaces>(() => _i67.HookaPlaces(get<_i50.PlacesCubit>()));
  gh.factory<_i68.Offers>(() => _i68.Offers(get<_i47.OffersCubit>()));
  gh.factory<_i69.OffersModule>(() =>
      _i69.OffersModule(get<_i68.Offers>(), get<_i49.OffersDetailsScreen>()));
  gh.factory<_i70.PlacesModule>(() =>
      _i70.PlacesModule(get<_i67.HookaPlaces>(), get<_i51.PlacesDetails>()));
  gh.factory<_i71.ProductModule>(() =>
      _i71.ProductModule(get<_i44.HookaProduct>(), get<_i66.DetailsProduct>()));
  gh.factory<_i72.SettingModule>(
      () => _i72.SettingModule(get<_i57.Settings>(), get<_i3.About>()));
  gh.factory<_i73.MyApp>(() => _i73.MyApp(
      get<_i12.LocalizationService>(),
      get<_i59.AuthModule>(),
      get<_i35.SplashModule>(),
      get<_i9.HomeModule>(),
      get<_i70.PlacesModule>(),
      get<_i62.BuddiesModule>(),
      get<_i69.OffersModule>(),
      get<_i72.SettingModule>(),
      get<_i71.ProductModule>(),
      get<_i54.ProfileModule>(),
      get<_i65.DetailsInvModule>(),
      get<_i60.BasketModule>(),
      get<_i64.CheckoutModule>()));
  return get;
}
