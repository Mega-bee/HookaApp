// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../address/address_module.dart' as _i99;
import '../address/repository/address_repository.dart' as _i42;
import '../address/state_manager/address_state_manager.dart' as _i80;
import '../address/ui/screen/Address_screen.dart' as _i98;
import '../auth/auth_module.dart' as _i100;
import '../auth/HiveSetUp.dart' as _i5;
import '../auth/repository/login_repository.dart' as _i23;
import '../auth/service/auth_service.dart' as _i6;
import '../auth/state_manager/forgot_pass_state_manager.dart' as _i54;
import '../auth/state_manager/forgot_screen_state_manager.dart' as _i55;
import '../auth/state_manager/login_state_manager.dart' as _i61;
import '../auth/state_manager/otp_state_screen.dart' as _i27;
import '../auth/state_manager/signup_state_manager.dart' as _i38;
import '../auth/ui/screens/forgot_otp_screen.dart' as _i78;
import '../auth/ui/screens/fotgot_screen.dart' as _i90;
import '../auth/ui/screens/login_screen.dart' as _i79;
import '../auth/ui/screens/otp_screen.dart' as _i28;
import '../auth/ui/screens/signup_screen.dart' as _i39;
import '../checkout/checkout_module.dart' as _i85;
import '../checkout/repository/checkout_repository.dart' as _i17;
import '../checkout/state_manager/checkout_state_manager.dart' as _i48;
import '../checkout/ui/screen/checkout.dart' as _i84;
import '../contact_us/contactus_module.dart' as _i86;
import '../contact_us/repository/contact_us_repository.dart' as _i18;
import '../contact_us/state_manager/contactus_state_manager.dart' as _i49;
import '../contact_us/ui/contactus.dart' as _i74;
import '../home_page/home_module.dart' as _i8;
import '../home_page/repository/firebase_token_repository.dart' as _i19;
import '../home_page/state_manager/firebase_state_manager.dart' as _i20;
import '../home_page/ui/screens/drawer_screen.dart' as _i7;
import '../home_page/ui/screens/home_screen.dart' as _i21;
import '../Hooka%20Basket/basket_module.dart' as _i81;
import '../Hooka%20Basket/repository/basket_repository.dart' as _i15;
import '../Hooka%20Basket/state_manager/basket_state_manager.dart' as _i45;
import '../Hooka%20Basket/ui/screen/basket_screen.dart' as _i46;
import '../hooka_buddies/buddies_module.dart' as _i83;
import '../hooka_buddies/repository/buddies_repository.dart' as _i16;
import '../hooka_buddies/state_manager/buddies_profile_state_manager.dart'
    as _i31;
import '../hooka_buddies/state_manager/Buddies_state_manager.dart' as _i47;
import '../hooka_buddies/ui/screens/buddies.dart' as _i82;
import '../hooka_buddies/ui/screens/invite.dart' as _i60;
import '../hooka_buddies/ui/screens/view_profile.dart' as _i41;
import '../hooka_places/places_module.dart' as _i94;
import '../hooka_places/repository/places_repository.dart' as _i29;
import '../hooka_places/state_manager/details_state_manager.dart' as _i52;
import '../hooka_places/state_manager/places_state_manager.dart' as _i70;
import '../hooka_places/ui/screen/hooka_places.dart' as _i91;
import '../hooka_places/ui/screen/places_details.dart' as _i71;
import '../hooka_product/product_module.dart' as _i95;
import '../hooka_product/repository/product_repository.dart' as _i30;
import '../hooka_product/state_manager/detailsprod_state_manager.dart' as _i72;
import '../hooka_product/state_manager/getproduct_state_manager.dart' as _i57;
import '../hooka_product/ui/screen/hooka_product.dart' as _i59;
import '../hooka_product/ui/screen/prod_details.dart' as _i88;
import '../invitations/details_module.dart' as _i87;
import '../invitations/repository/invitations_repository.dart' as _i22;
import '../invitations/state_manager/invitation_state_manager.dart' as _i33;
import '../invitations/state_manager/sent_state_manager.dart' as _i35;
import '../invitations/ui/screen/invitations.dart' as _i9;
import '../invitations/ui/screen/received_tab.dart' as _i34;
import '../invitations/ui/screen/sent_details.dart' as _i75;
import '../invitations/ui/screen/sent_tab.dart' as _i36;
import '../localization_service/localizationSservice.dart' as _i10;
import '../main.dart' as _i101;
import '../module_network/http_client/http_client.dart' as _i14;
import '../my_orders/order_module.dart' as _i69;
import '../my_orders/repository/order_repository.dart' as _i26;
import '../my_orders/state_manager/all_order_state_manager.dart' as _i43;
import '../my_orders/state_manager/current_order_state_manager.dart' as _i50;
import '../my_orders/state_manager/details_order_state_manager.dart' as _i53;
import '../my_orders/ui/Screen/allorder_tab.dart' as _i44;
import '../my_orders/ui/Screen/current_tab.dart' as _i51;
import '../my_orders/ui/Screen/myorder.dart' as _i12;
import '../my_orders/ui/Screen/order_details.dart' as _i68;
import '../notifications/notification_module.dart' as _i64;
import '../notifications/repository/notification_repository.dart' as _i24;
import '../notifications/state_manager/notification_state_manager.dart' as _i62;
import '../notifications/ui/screen/notifications.dart' as _i63;
import '../offers/offers_module.dart' as _i93;
import '../offers/repository/offers_repository.dart' as _i25;
import '../offers/state_manager/offers_details_state_manager.dart' as _i66;
import '../offers/state_manager/offers_state_manager.dart' as _i65;
import '../offers/widget/screen/offers.dart' as _i92;
import '../offers/widget/screen/offers_details_screens.dart' as _i67;
import '../profile/profile_module.dart' as _i96;
import '../profile/repository/profile_repository.dart' as _i32;
import '../profile/state_manager/edit_profile_state_manger.dart' as _i56;
import '../profile/state_manager/profile_state_manager.dart' as _i58;
import '../profile/ui/screens/edit_profile.dart' as _i89;
import '../profile/ui/screens/profile.dart' as _i73;
import '../settings/repository/setting_repository.dart' as _i37;
import '../settings/setting_module.dart' as _i97;
import '../settings/state_manager/setting_state_manager.dart' as _i76;
import '../settings/ui/about.dart' as _i3;
import '../settings/ui/screen/settings.dart' as _i77;
import '../splash_screen/splash_module.dart' as _i40;
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
  gh.factory<_i7.DrawerScreen>(() => _i7.DrawerScreen(get<_i6.AuthService>()));
  gh.factory<_i8.HomeModule>(() => _i8.HomeModule(get<_i7.DrawerScreen>()));
  gh.factory<_i9.Invitations>(() => _i9.Invitations());
  gh.factory<_i10.LocalizationService>(() => _i10.LocalizationService());
  gh.factory<_i11.Logger>(() => _i11.Logger());
  gh.factory<_i12.MyOrder>(() => _i12.MyOrder());
  gh.factory<_i13.SplashScreen>(
      () => _i13.SplashScreen(get<_i6.AuthService>()));
  gh.factory<_i14.ApiClient>(() => _i14.ApiClient(get<_i11.Logger>()));
  gh.factory<_i15.BasketRepository>(() =>
      _i15.BasketRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i16.BuddiesRepository>(() =>
      _i16.BuddiesRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i17.CheckoutRepository>(() =>
      _i17.CheckoutRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i18.ContactUsRepository>(() =>
      _i18.ContactUsRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i19.FireBaseRepository>(() =>
      _i19.FireBaseRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i20.FirebaseCubit>(() => _i20.FirebaseCubit(
      get<_i19.FireBaseRepository>(), get<_i6.AuthService>()));
  gh.factory<_i21.HomeScreen>(() => _i21.HomeScreen(get<_i20.FirebaseCubit>()));
  gh.factory<_i22.InvitationsRepository>(() => _i22.InvitationsRepository(
      get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i23.LoginRepository>(() =>
      _i23.LoginRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i24.NotificationRepository>(() => _i24.NotificationRepository(
      get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i25.OffersRepository>(() =>
      _i25.OffersRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i26.OrderRepository>(() =>
      _i26.OrderRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i27.OtpCubit>(
      () => _i27.OtpCubit(get<_i23.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i28.PinCodeVerificationScreen>(
      () => _i28.PinCodeVerificationScreen(get<_i27.OtpCubit>()));
  gh.factory<_i29.PlacesRepository>(() =>
      _i29.PlacesRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i30.ProductsRepository>(() =>
      _i30.ProductsRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i31.ProfileBuddiesCubit>(() => _i31.ProfileBuddiesCubit(
      get<_i16.BuddiesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i32.ProfileRepository>(() =>
      _i32.ProfileRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i33.RecInvitationCubit>(() => _i33.RecInvitationCubit(
      get<_i22.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i34.ReceivedTab>(
      () => _i34.ReceivedTab(get<_i33.RecInvitationCubit>()));
  gh.factory<_i35.SentInvitationCubit>(() => _i35.SentInvitationCubit(
      get<_i22.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i36.SentTab>(() => _i36.SentTab(get<_i35.SentInvitationCubit>()));
  gh.factory<_i37.SettingRepository>(() =>
      _i37.SettingRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i38.SignUpCubit>(
      () => _i38.SignUpCubit(get<_i23.LoginRepository>()));
  gh.factory<_i39.SignupScreen>(
      () => _i39.SignupScreen(cubit: get<_i38.SignUpCubit>()));
  gh.factory<_i40.SplashModule>(
      () => _i40.SplashModule(get<_i13.SplashScreen>()));
  gh.factory<_i41.ViewProfileBuddie>(
      () => _i41.ViewProfileBuddie(get<_i31.ProfileBuddiesCubit>()));
  gh.factory<_i42.AddressRepository>(() =>
      _i42.AddressRepository(get<_i14.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i43.AllOrderCubit>(() =>
      _i43.AllOrderCubit(get<_i26.OrderRepository>(), get<_i6.AuthService>()));
  gh.factory<_i44.AllOrderTabb>(
      () => _i44.AllOrderTabb(get<_i43.AllOrderCubit>()));
  gh.factory<_i45.BasketCubit>(() =>
      _i45.BasketCubit(get<_i15.BasketRepository>(), get<_i6.AuthService>()));
  gh.factory<_i46.BasketScreen>(
      () => _i46.BasketScreen(get<_i45.BasketCubit>()));
  gh.factory<_i47.BuddiesCubit>(() => _i47.BuddiesCubit(
      get<_i16.BuddiesRepository>(), get<_i29.PlacesRepository>()));
  gh.factory<_i48.CheckoutCubit>(() => _i48.CheckoutCubit(
      get<_i17.CheckoutRepository>(), get<_i6.AuthService>()));
  gh.factory<_i49.ContactUsCubit>(() => _i49.ContactUsCubit(
      get<_i18.ContactUsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i50.CurrentCubit>(() =>
      _i50.CurrentCubit(get<_i26.OrderRepository>(), get<_i6.AuthService>()));
  gh.factory<_i51.CurrentTab>(() => _i51.CurrentTab(get<_i50.CurrentCubit>()));
  gh.factory<_i52.DetailsCubit>(() =>
      _i52.DetailsCubit(get<_i29.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i53.DetailsOrderCubit>(() => _i53.DetailsOrderCubit(
      get<_i26.OrderRepository>(), get<_i6.AuthService>()));
  gh.factory<_i54.ForgotOtpCubit>(() =>
      _i54.ForgotOtpCubit(get<_i23.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i55.ForgotScreenCubit>(() => _i55.ForgotScreenCubit(
      get<_i23.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i56.GetEditProfileCubit>(() => _i56.GetEditProfileCubit(
      get<_i32.ProfileRepository>(), get<_i6.AuthService>()));
  gh.factory<_i57.GetProductCubit>(() => _i57.GetProductCubit(
      get<_i30.ProductsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i58.GetProfileCubit>(() => _i58.GetProfileCubit(
      get<_i32.ProfileRepository>(), get<_i6.AuthService>()));
  gh.factory<_i59.HookaProduct>(
      () => _i59.HookaProduct(get<_i57.GetProductCubit>()));
  gh.factory<_i60.InviteBuddies>(
      () => _i60.InviteBuddies(get<_i47.BuddiesCubit>()));
  gh.factory<_i61.LoginCubit>(() =>
      _i61.LoginCubit(get<_i23.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i62.NotificationCubit>(() => _i62.NotificationCubit(
      get<_i24.NotificationRepository>(), get<_i6.AuthService>()));
  gh.factory<_i63.Notifications>(
      () => _i63.Notifications(get<_i62.NotificationCubit>()));
  gh.factory<_i64.NotificationsModule>(
      () => _i64.NotificationsModule(get<_i63.Notifications>()));
  gh.factory<_i65.OffersCubit>(() =>
      _i65.OffersCubit(get<_i25.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i66.OffersDetailsCubit>(() => _i66.OffersDetailsCubit(
      get<_i25.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i67.OffersDetailsScreen>(
      () => _i67.OffersDetailsScreen(get<_i66.OffersDetailsCubit>()));
  gh.factory<_i68.OrderDetails>(
      () => _i68.OrderDetails(get<_i53.DetailsOrderCubit>()));
  gh.factory<_i69.OrderModule>(
      () => _i69.OrderModule(get<_i12.MyOrder>(), get<_i68.OrderDetails>()));
  gh.factory<_i70.PlacesCubit>(() =>
      _i70.PlacesCubit(get<_i29.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i71.PlacesDetails>(
      () => _i71.PlacesDetails(get<_i52.DetailsCubit>()));
  gh.factory<_i72.ProdDetailsCubit>(() => _i72.ProdDetailsCubit(
      get<_i30.ProductsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i73.Profile>(() => _i73.Profile(get<_i58.GetProfileCubit>()));
  gh.factory<_i74.ScreenContactus>(
      () => _i74.ScreenContactus(get<_i49.ContactUsCubit>()));
  gh.factory<_i75.SentDetails>(
      () => _i75.SentDetails(get<_i35.SentInvitationCubit>()));
  gh.factory<_i76.SettingCubit>(() =>
      _i76.SettingCubit(get<_i37.SettingRepository>(), get<_i6.AuthService>()));
  gh.factory<_i77.Settings>(() => _i77.Settings(get<_i76.SettingCubit>()));
  gh.factory<_i78.VerificationOtpForgotScreen>(
      () => _i78.VerificationOtpForgotScreen(get<_i54.ForgotOtpCubit>()));
  gh.factory<_i79.loginScreen>(
      () => _i79.loginScreen(cubit: get<_i61.LoginCubit>()));
  gh.factory<_i80.AddressCubit>(() =>
      _i80.AddressCubit(get<_i42.AddressRepository>(), get<_i6.AuthService>()));
  gh.factory<_i81.BasketModule>(
      () => _i81.BasketModule(get<_i46.BasketScreen>()));
  gh.factory<_i82.Buddies>(() => _i82.Buddies(get<_i47.BuddiesCubit>()));
  gh.factory<_i83.BuddiesModule>(() => _i83.BuddiesModule(get<_i82.Buddies>(),
      get<_i60.InviteBuddies>(), get<_i41.ViewProfileBuddie>()));
  gh.factory<_i84.Checkout>(() => _i84.Checkout(get<_i48.CheckoutCubit>()));
  gh.factory<_i85.CheckoutModule>(
      () => _i85.CheckoutModule(get<_i84.Checkout>()));
  gh.factory<_i86.ContactUsSModule>(
      () => _i86.ContactUsSModule(get<_i74.ScreenContactus>()));
  gh.factory<_i87.DetailsInvModule>(
      () => _i87.DetailsInvModule(get<_i75.SentDetails>()));
  gh.factory<_i88.DetailsProduct>(
      () => _i88.DetailsProduct(get<_i72.ProdDetailsCubit>()));
  gh.factory<_i89.EditProfile>(
      () => _i89.EditProfile(get<_i56.GetEditProfileCubit>()));
  gh.factory<_i90.ForgotScreen>(
      () => _i90.ForgotScreen(get<_i55.ForgotScreenCubit>()));
  gh.factory<_i91.HookaPlaces>(() => _i91.HookaPlaces(get<_i70.PlacesCubit>()));
  gh.factory<_i92.Offers>(() => _i92.Offers(get<_i65.OffersCubit>()));
  gh.factory<_i93.OffersModule>(() =>
      _i93.OffersModule(get<_i92.Offers>(), get<_i67.OffersDetailsScreen>()));
  gh.factory<_i94.PlacesModule>(() =>
      _i94.PlacesModule(get<_i91.HookaPlaces>(), get<_i71.PlacesDetails>()));
  gh.factory<_i95.ProductModule>(() =>
      _i95.ProductModule(get<_i59.HookaProduct>(), get<_i88.DetailsProduct>()));
  gh.factory<_i96.ProfileModule>(
      () => _i96.ProfileModule(get<_i73.Profile>(), get<_i89.EditProfile>()));
  gh.factory<_i97.SettingModule>(
      () => _i97.SettingModule(get<_i77.Settings>(), get<_i3.About>()));
  gh.factory<_i98.AddresScreen>(
      () => _i98.AddresScreen(get<_i80.AddressCubit>()));
  gh.factory<_i99.AddressModule>(
      () => _i99.AddressModule(get<_i98.AddresScreen>()));
  gh.factory<_i100.AuthModule>(() => _i100.AuthModule(
      get<_i79.loginScreen>(),
      get<_i39.SignupScreen>(),
      get<_i28.PinCodeVerificationScreen>(),
      get<_i90.ForgotScreen>(),
      get<_i78.VerificationOtpForgotScreen>()));
  gh.factory<_i101.MyApp>(() => _i101.MyApp(
      get<_i10.LocalizationService>(),
      get<_i100.AuthModule>(),
      get<_i40.SplashModule>(),
      get<_i8.HomeModule>(),
      get<_i94.PlacesModule>(),
      get<_i69.OrderModule>(),
      get<_i83.BuddiesModule>(),
      get<_i93.OffersModule>(),
      get<_i97.SettingModule>(),
      get<_i86.ContactUsSModule>(),
      get<_i95.ProductModule>(),
      get<_i96.ProfileModule>(),
      get<_i87.DetailsInvModule>(),
      get<_i81.BasketModule>(),
      get<_i85.CheckoutModule>(),
      get<_i99.AddressModule>(),
      get<_i64.NotificationsModule>()));
  return get;
}
