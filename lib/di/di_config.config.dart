// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i68;
import '../auth/HiveSetUp.dart' as _i5;
import '../auth/repository/login_repository.dart' as _i22;
import '../auth/service/auth_service.dart' as _i6;
import '../auth/state_manager/login_state_manager.dart' as _i55;
import '../auth/state_manager/otp_state_screen.dart' as _i25;
import '../auth/state_manager/signup_state_manager.dart' as _i36;
import '../auth/ui/screens/login_screen.dart' as _i67;
import '../auth/ui/screens/otp_screen.dart' as _i26;
import '../auth/ui/screens/signup_screen.dart' as _i37;
import '../checkout/checkout_module.dart' as _i73;
import '../checkout/repository/checkout_repository.dart' as _i19;
import '../checkout/state_manager/checkout_state_manager.dart' as _i45;
import '../checkout/ui/screen/checkout.dart' as _i72;
import '../contact_us/contactus_module.dart' as _i74;
import '../contact_us/repository/contact_us_repository.dart' as _i20;
import '../contact_us/state_manager/contactus_state_manager.dart' as _i46;
import '../contact_us/ui/contactus.dart' as _i63;
import '../home_page/home_module.dart' as _i8;
import '../home_page/ui/screens/drawer_screen.dart' as _i7;
import '../home_page/ui/screens/home_screen.dart' as _i9;
import '../Hooka%20Basket/basket_module.dart' as _i69;
import '../Hooka%20Basket/repository/basket_repository.dart' as _i17;
import '../Hooka%20Basket/state_manager/basket_state_manager.dart' as _i42;
import '../Hooka%20Basket/ui/screen/basket_screen.dart' as _i43;
import '../hooka_buddies/buddies_module.dart' as _i71;
import '../hooka_buddies/repository/buddies_repository.dart' as _i18;
import '../hooka_buddies/state_manager/buddies_profile_state_manager.dart'
    as _i29;
import '../hooka_buddies/state_manager/Buddies_state_manager.dart' as _i44;
import '../hooka_buddies/ui/screens/buddies.dart' as _i70;
import '../hooka_buddies/ui/screens/invite.dart' as _i54;
import '../hooka_buddies/ui/screens/view_profile.dart' as _i39;
import '../hooka_places/places_module.dart' as _i81;
import '../hooka_places/repository/places_repository.dart' as _i27;
import '../hooka_places/state_manager/details_state_manager.dart' as _i49;
import '../hooka_places/state_manager/places_state_manager.dart' as _i59;
import '../hooka_places/ui/screen/hooka_places.dart' as _i78;
import '../hooka_places/ui/screen/places_details.dart' as _i60;
import '../hooka_product/product_module.dart' as _i82;
import '../hooka_product/repository/product_repository.dart' as _i28;
import '../hooka_product/state_manager/detailsprod_state_manager.dart' as _i61;
import '../hooka_product/state_manager/getproduct_state_manager.dart' as _i51;
import '../hooka_product/ui/screen/hooka_product.dart' as _i53;
import '../hooka_product/ui/screen/prod_details.dart' as _i76;
import '../invitations/details_module.dart' as _i75;
import '../invitations/repository/invitations_repository.dart' as _i21;
import '../invitations/state_manager/invitation_state_manager.dart' as _i31;
import '../invitations/state_manager/sent_state_manager.dart' as _i33;
import '../invitations/ui/screen/invitations.dart' as _i10;
import '../invitations/ui/screen/received_tab.dart' as _i32;
import '../invitations/ui/screen/sent_details.dart' as _i64;
import '../invitations/ui/screen/sent_tab.dart' as _i34;
import '../localization_service/localizationSservice.dart' as _i11;
import '../main.dart' as _i85;
import '../module_network/http_client/http_client.dart' as _i16;
import '../my_orders/order_module.dart' as _i14;
import '../my_orders/repository/order_repository.dart' as _i24;
import '../my_orders/state_manager/all_order_state_manager.dart' as _i40;
import '../my_orders/state_manager/current_order_state_manager.dart' as _i47;
import '../my_orders/ui/Screen/allorder_tab.dart' as _i41;
import '../my_orders/ui/Screen/current_tab.dart' as _i48;
import '../my_orders/ui/Screen/myorder.dart' as _i13;
import '../offers/offers_module.dart' as _i80;
import '../offers/repository/offers_repository.dart' as _i23;
import '../offers/state_manager/offers_details_state_manager.dart' as _i57;
import '../offers/state_manager/offers_state_manager.dart' as _i56;
import '../offers/widget/screen/offers.dart' as _i79;
import '../offers/widget/screen/offers_details_screens.dart' as _i58;
import '../profile/profile_module.dart' as _i83;
import '../profile/repository/profile_repository.dart' as _i30;
import '../profile/state_manager/edit_profile_state_manger.dart' as _i50;
import '../profile/state_manager/profile_state_manager.dart' as _i52;
import '../profile/ui/screens/edit_profile.dart' as _i77;
import '../profile/ui/screens/profile.dart' as _i62;
import '../settings/repository/setting_repository.dart' as _i35;
import '../settings/setting_module.dart' as _i84;
import '../settings/state_manager/setting_state_manager.dart' as _i65;
import '../settings/ui/about.dart' as _i3;
import '../settings/ui/screen/settings.dart' as _i66;
import '../splash_screen/splash_module.dart' as _i38;
import '../splash_screen/ui/splash_screen.dart' as _i15;
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
  gh.factory<_i13.MyOrder>(() => _i13.MyOrder());
  gh.factory<_i14.OrderModule>(() => _i14.OrderModule(get<_i13.MyOrder>()));
  gh.factory<_i15.SplashScreen>(
      () => _i15.SplashScreen(get<_i6.AuthService>()));
  gh.factory<_i16.ApiClient>(() => _i16.ApiClient(get<_i12.Logger>()));
  gh.factory<_i17.BasketRepository>(() =>
      _i17.BasketRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i18.BuddiesRepository>(() =>
      _i18.BuddiesRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i19.CheckoutRepository>(() =>
      _i19.CheckoutRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i20.ContactUsRepository>(() =>
      _i20.ContactUsRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i21.InvitationsRepository>(() => _i21.InvitationsRepository(
      get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i22.LoginRepository>(() =>
      _i22.LoginRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i23.OffersRepository>(() =>
      _i23.OffersRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i24.OrderRepository>(() =>
      _i24.OrderRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i25.OtpCubit>(
      () => _i25.OtpCubit(get<_i22.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i26.PinCodeVerificationScreen>(
      () => _i26.PinCodeVerificationScreen(get<_i25.OtpCubit>()));
  gh.factory<_i27.PlacesRepository>(() =>
      _i27.PlacesRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i28.ProductsRepository>(() =>
      _i28.ProductsRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i29.ProfileBuddiesCubit>(() => _i29.ProfileBuddiesCubit(
      get<_i18.BuddiesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i30.ProfileRepository>(() =>
      _i30.ProfileRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i31.RecInvitationCubit>(() => _i31.RecInvitationCubit(
      get<_i21.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i32.ReceivedTab>(
      () => _i32.ReceivedTab(get<_i31.RecInvitationCubit>()));
  gh.factory<_i33.SentInvitationCubit>(() => _i33.SentInvitationCubit(
      get<_i21.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i34.SentTab>(() => _i34.SentTab(get<_i33.SentInvitationCubit>()));
  gh.factory<_i35.SettingRepository>(() =>
      _i35.SettingRepository(get<_i16.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i36.SignUpCubit>(
      () => _i36.SignUpCubit(get<_i22.LoginRepository>()));
  gh.factory<_i37.SignupScreen>(
      () => _i37.SignupScreen(cubit: get<_i36.SignUpCubit>()));
  gh.factory<_i38.SplashModule>(
      () => _i38.SplashModule(get<_i15.SplashScreen>()));
  gh.factory<_i39.ViewProfileBuddie>(
      () => _i39.ViewProfileBuddie(get<_i29.ProfileBuddiesCubit>()));
  gh.factory<_i40.AllOrderCubit>(() =>
      _i40.AllOrderCubit(get<_i24.OrderRepository>(), get<_i6.AuthService>()));
  gh.factory<_i41.AllOrderTabb>(
      () => _i41.AllOrderTabb(get<_i40.AllOrderCubit>()));
  gh.factory<_i42.BasketCubit>(() =>
      _i42.BasketCubit(get<_i17.BasketRepository>(), get<_i6.AuthService>()));
  gh.factory<_i43.BasketScreen>(
      () => _i43.BasketScreen(get<_i42.BasketCubit>()));
  gh.factory<_i44.BuddiesCubit>(() => _i44.BuddiesCubit(
      get<_i18.BuddiesRepository>(), get<_i27.PlacesRepository>()));
  gh.factory<_i45.CheckoutCubit>(() => _i45.CheckoutCubit(
      get<_i19.CheckoutRepository>(), get<_i6.AuthService>()));
  gh.factory<_i46.ContactUsCubit>(() => _i46.ContactUsCubit(
      get<_i20.ContactUsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i47.CurrentCubit>(() =>
      _i47.CurrentCubit(get<_i24.OrderRepository>(), get<_i6.AuthService>()));
  gh.factory<_i48.CurrentTab>(() => _i48.CurrentTab(get<_i47.CurrentCubit>()));
  gh.factory<_i49.DetailsCubit>(() =>
      _i49.DetailsCubit(get<_i27.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i50.GetEditProfileCubit>(() => _i50.GetEditProfileCubit(
      get<_i30.ProfileRepository>(), get<_i6.AuthService>()));
  gh.factory<_i51.GetProductCubit>(() => _i51.GetProductCubit(
      get<_i28.ProductsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i52.GetProfileCubit>(() => _i52.GetProfileCubit(
      get<_i30.ProfileRepository>(), get<_i6.AuthService>()));
  gh.factory<_i53.HookaProduct>(
      () => _i53.HookaProduct(get<_i51.GetProductCubit>()));
  gh.factory<_i54.InviteBuddies>(
      () => _i54.InviteBuddies(get<_i44.BuddiesCubit>()));
  gh.factory<_i55.LoginCubit>(() =>
      _i55.LoginCubit(get<_i22.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i56.OffersCubit>(() =>
      _i56.OffersCubit(get<_i23.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i57.OffersDetailsCubit>(() => _i57.OffersDetailsCubit(
      get<_i23.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i58.OffersDetailsScreen>(
      () => _i58.OffersDetailsScreen(get<_i57.OffersDetailsCubit>()));
  gh.factory<_i59.PlacesCubit>(() =>
      _i59.PlacesCubit(get<_i27.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i60.PlacesDetails>(
      () => _i60.PlacesDetails(get<_i49.DetailsCubit>()));
  gh.factory<_i61.ProdDetailsCubit>(() => _i61.ProdDetailsCubit(
      get<_i28.ProductsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i62.Profile>(() => _i62.Profile(get<_i52.GetProfileCubit>()));
  gh.factory<_i63.ScreenContactus>(
      () => _i63.ScreenContactus(get<_i46.ContactUsCubit>()));
  gh.factory<_i64.SentDetails>(
      () => _i64.SentDetails(get<_i33.SentInvitationCubit>()));
  gh.factory<_i65.SettingCubit>(() =>
      _i65.SettingCubit(get<_i35.SettingRepository>(), get<_i6.AuthService>()));
  gh.factory<_i66.Settings>(() => _i66.Settings(get<_i65.SettingCubit>()));
  gh.factory<_i67.loginScreen>(
      () => _i67.loginScreen(cubit: get<_i55.LoginCubit>()));
  gh.factory<_i68.AuthModule>(() => _i68.AuthModule(get<_i67.loginScreen>(),
      get<_i37.SignupScreen>(), get<_i26.PinCodeVerificationScreen>()));
  gh.factory<_i69.BasketModule>(
      () => _i69.BasketModule(get<_i43.BasketScreen>()));
  gh.factory<_i70.Buddies>(() => _i70.Buddies(get<_i44.BuddiesCubit>()));
  gh.factory<_i71.BuddiesModule>(() => _i71.BuddiesModule(get<_i70.Buddies>(),
      get<_i54.InviteBuddies>(), get<_i39.ViewProfileBuddie>()));
  gh.factory<_i72.Checkout>(() => _i72.Checkout(get<_i45.CheckoutCubit>()));
  gh.factory<_i73.CheckoutModule>(
      () => _i73.CheckoutModule(get<_i72.Checkout>()));
  gh.factory<_i74.ContactUsSModule>(
      () => _i74.ContactUsSModule(get<_i63.ScreenContactus>()));
  gh.factory<_i75.DetailsInvModule>(
      () => _i75.DetailsInvModule(get<_i64.SentDetails>()));
  gh.factory<_i76.DetailsProduct>(
      () => _i76.DetailsProduct(get<_i61.ProdDetailsCubit>()));
  gh.factory<_i77.EditProfile>(
      () => _i77.EditProfile(get<_i50.GetEditProfileCubit>()));
  gh.factory<_i78.HookaPlaces>(() => _i78.HookaPlaces(get<_i59.PlacesCubit>()));
  gh.factory<_i79.Offers>(() => _i79.Offers(get<_i56.OffersCubit>()));
  gh.factory<_i80.OffersModule>(() =>
      _i80.OffersModule(get<_i79.Offers>(), get<_i58.OffersDetailsScreen>()));
  gh.factory<_i81.PlacesModule>(() =>
      _i81.PlacesModule(get<_i78.HookaPlaces>(), get<_i60.PlacesDetails>()));
  gh.factory<_i82.ProductModule>(() =>
      _i82.ProductModule(get<_i53.HookaProduct>(), get<_i76.DetailsProduct>()));
  gh.factory<_i83.ProfileModule>(
      () => _i83.ProfileModule(get<_i62.Profile>(), get<_i77.EditProfile>()));
  gh.factory<_i84.SettingModule>(
      () => _i84.SettingModule(get<_i66.Settings>(), get<_i3.About>()));
  gh.factory<_i85.MyApp>(() => _i85.MyApp(
      get<_i11.LocalizationService>(),
      get<_i68.AuthModule>(),
      get<_i38.SplashModule>(),
      get<_i8.HomeModule>(),
      get<_i81.PlacesModule>(),
      get<_i14.OrderModule>(),
      get<_i71.BuddiesModule>(),
      get<_i80.OffersModule>(),
      get<_i84.SettingModule>(),
      get<_i74.ContactUsSModule>(),
      get<_i82.ProductModule>(),
      get<_i83.ProfileModule>(),
      get<_i75.DetailsInvModule>(),
      get<_i69.BasketModule>(),
      get<_i73.CheckoutModule>()));
  return get;
}
