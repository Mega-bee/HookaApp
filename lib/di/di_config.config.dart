// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i70;
import '../auth/HiveSetUp.dart' as _i5;
import '../auth/repository/login_repository.dart' as _i21;
import '../auth/service/auth_service.dart' as _i6;
import '../auth/state_manager/login_state_manager.dart' as _i55;
import '../auth/state_manager/otp_state_screen.dart' as _i24;
import '../auth/state_manager/signup_state_manager.dart' as _i35;
import '../auth/ui/screens/login_screen.dart' as _i69;
import '../auth/ui/screens/otp_screen.dart' as _i25;
import '../auth/ui/screens/signup_screen.dart' as _i36;
import '../checkout/checkout_module.dart' as _i75;
import '../checkout/repository/checkout_repository.dart' as _i18;
import '../checkout/state_manager/checkout_state_manager.dart' as _i44;
import '../checkout/ui/screen/checkout.dart' as _i74;
import '../contact_us/contactus_module.dart' as _i76;
import '../contact_us/repository/contact_us_repository.dart' as _i19;
import '../contact_us/state_manager/contactus_state_manager.dart' as _i45;
import '../contact_us/ui/contactus.dart' as _i65;
import '../home_page/home_module.dart' as _i8;
import '../home_page/ui/screens/drawer_screen.dart' as _i7;
import '../home_page/ui/screens/home_screen.dart' as _i9;
import '../Hooka%20Basket/basket_module.dart' as _i71;
import '../Hooka%20Basket/repository/basket_repository.dart' as _i16;
import '../Hooka%20Basket/state_manager/basket_state_manager.dart' as _i41;
import '../Hooka%20Basket/ui/screen/basket_screen.dart' as _i42;
import '../hooka_buddies/buddies_module.dart' as _i73;
import '../hooka_buddies/repository/buddies_repository.dart' as _i17;
import '../hooka_buddies/state_manager/buddies_profile_state_manager.dart'
    as _i28;
import '../hooka_buddies/state_manager/Buddies_state_manager.dart' as _i43;
import '../hooka_buddies/ui/screens/buddies.dart' as _i72;
import '../hooka_buddies/ui/screens/invite.dart' as _i54;
import '../hooka_buddies/ui/screens/view_profile.dart' as _i38;
import '../hooka_places/places_module.dart' as _i83;
import '../hooka_places/repository/places_repository.dart' as _i26;
import '../hooka_places/state_manager/details_state_manager.dart' as _i48;
import '../hooka_places/state_manager/places_state_manager.dart' as _i61;
import '../hooka_places/ui/screen/hooka_places.dart' as _i80;
import '../hooka_places/ui/screen/places_details.dart' as _i62;
import '../hooka_product/product_module.dart' as _i84;
import '../hooka_product/repository/product_repository.dart' as _i27;
import '../hooka_product/state_manager/detailsprod_state_manager.dart' as _i63;
import '../hooka_product/state_manager/getproduct_state_manager.dart' as _i51;
import '../hooka_product/ui/screen/hooka_product.dart' as _i53;
import '../hooka_product/ui/screen/prod_details.dart' as _i78;
import '../invitations/details_module.dart' as _i77;
import '../invitations/repository/invitations_repository.dart' as _i20;
import '../invitations/state_manager/invitation_state_manager.dart' as _i30;
import '../invitations/state_manager/sent_state_manager.dart' as _i32;
import '../invitations/ui/screen/invitations.dart' as _i10;
import '../invitations/ui/screen/received_tab.dart' as _i31;
import '../invitations/ui/screen/sent_details.dart' as _i66;
import '../invitations/ui/screen/sent_tab.dart' as _i33;
import '../localization_service/localizationSservice.dart' as _i11;
import '../main.dart' as _i87;
import '../module_network/http_client/http_client.dart' as _i15;
import '../my_orders/order_module.dart' as _i60;
import '../my_orders/repository/order_repository.dart' as _i23;
import '../my_orders/state_manager/all_order_state_manager.dart' as _i39;
import '../my_orders/state_manager/current_order_state_manager.dart' as _i46;
import '../my_orders/state_manager/details_order_state_manager.dart' as _i49;
import '../my_orders/ui/Screen/allorder_tab.dart' as _i40;
import '../my_orders/ui/Screen/current_tab.dart' as _i47;
import '../my_orders/ui/Screen/myorder.dart' as _i13;
import '../my_orders/ui/Screen/order_details.dart' as _i59;
import '../offers/offers_module.dart' as _i82;
import '../offers/repository/offers_repository.dart' as _i22;
import '../offers/state_manager/offers_details_state_manager.dart' as _i57;
import '../offers/state_manager/offers_state_manager.dart' as _i56;
import '../offers/widget/screen/offers.dart' as _i81;
import '../offers/widget/screen/offers_details_screens.dart' as _i58;
import '../profile/profile_module.dart' as _i85;
import '../profile/repository/profile_repository.dart' as _i29;
import '../profile/state_manager/edit_profile_state_manger.dart' as _i50;
import '../profile/state_manager/profile_state_manager.dart' as _i52;
import '../profile/ui/screens/edit_profile.dart' as _i79;
import '../profile/ui/screens/profile.dart' as _i64;
import '../settings/repository/setting_repository.dart' as _i34;
import '../settings/setting_module.dart' as _i86;
import '../settings/state_manager/setting_state_manager.dart' as _i67;
import '../settings/ui/about.dart' as _i3;
import '../settings/ui/screen/settings.dart' as _i68;
import '../splash_screen/splash_module.dart' as _i37;
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
  gh.factory<_i13.MyOrder>(() => _i13.MyOrder());
  gh.factory<_i14.SplashScreen>(
      () => _i14.SplashScreen(get<_i6.AuthService>()));
  gh.factory<_i15.ApiClient>(() => _i15.ApiClient(get<_i12.Logger>()));
  gh.factory<_i16.BasketRepository>(() =>
      _i16.BasketRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i17.BuddiesRepository>(() =>
      _i17.BuddiesRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i18.CheckoutRepository>(() =>
      _i18.CheckoutRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i19.ContactUsRepository>(() =>
      _i19.ContactUsRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i20.InvitationsRepository>(() => _i20.InvitationsRepository(
      get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i21.LoginRepository>(() =>
      _i21.LoginRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i22.OffersRepository>(() =>
      _i22.OffersRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i23.OrderRepository>(() =>
      _i23.OrderRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i24.OtpCubit>(
      () => _i24.OtpCubit(get<_i21.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i25.PinCodeVerificationScreen>(
      () => _i25.PinCodeVerificationScreen(get<_i24.OtpCubit>()));
  gh.factory<_i26.PlacesRepository>(() =>
      _i26.PlacesRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i27.ProductsRepository>(() =>
      _i27.ProductsRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i28.ProfileBuddiesCubit>(() => _i28.ProfileBuddiesCubit(
      get<_i17.BuddiesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i29.ProfileRepository>(() =>
      _i29.ProfileRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i30.RecInvitationCubit>(() => _i30.RecInvitationCubit(
      get<_i20.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i31.ReceivedTab>(
      () => _i31.ReceivedTab(get<_i30.RecInvitationCubit>()));
  gh.factory<_i32.SentInvitationCubit>(() => _i32.SentInvitationCubit(
      get<_i20.InvitationsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i33.SentTab>(() => _i33.SentTab(get<_i32.SentInvitationCubit>()));
  gh.factory<_i34.SettingRepository>(() =>
      _i34.SettingRepository(get<_i15.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i35.SignUpCubit>(
      () => _i35.SignUpCubit(get<_i21.LoginRepository>()));
  gh.factory<_i36.SignupScreen>(
      () => _i36.SignupScreen(cubit: get<_i35.SignUpCubit>()));
  gh.factory<_i37.SplashModule>(
      () => _i37.SplashModule(get<_i14.SplashScreen>()));
  gh.factory<_i38.ViewProfileBuddie>(
      () => _i38.ViewProfileBuddie(get<_i28.ProfileBuddiesCubit>()));
  gh.factory<_i39.AllOrderCubit>(() =>
      _i39.AllOrderCubit(get<_i23.OrderRepository>(), get<_i6.AuthService>()));
  gh.factory<_i40.AllOrderTabb>(
      () => _i40.AllOrderTabb(get<_i39.AllOrderCubit>()));
  gh.factory<_i41.BasketCubit>(() =>
      _i41.BasketCubit(get<_i16.BasketRepository>(), get<_i6.AuthService>()));
  gh.factory<_i42.BasketScreen>(
      () => _i42.BasketScreen(get<_i41.BasketCubit>()));
  gh.factory<_i43.BuddiesCubit>(() => _i43.BuddiesCubit(
      get<_i17.BuddiesRepository>(), get<_i26.PlacesRepository>()));
  gh.factory<_i44.CheckoutCubit>(() => _i44.CheckoutCubit(
      get<_i18.CheckoutRepository>(), get<_i6.AuthService>()));
  gh.factory<_i45.ContactUsCubit>(() => _i45.ContactUsCubit(
      get<_i19.ContactUsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i46.CurrentCubit>(() =>
      _i46.CurrentCubit(get<_i23.OrderRepository>(), get<_i6.AuthService>()));
  gh.factory<_i47.CurrentTab>(() => _i47.CurrentTab(get<_i46.CurrentCubit>()));
  gh.factory<_i48.DetailsCubit>(() =>
      _i48.DetailsCubit(get<_i26.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i49.DetailsOrderCubit>(() => _i49.DetailsOrderCubit(
      get<_i23.OrderRepository>(), get<_i6.AuthService>()));
  gh.factory<_i50.GetEditProfileCubit>(() => _i50.GetEditProfileCubit(
      get<_i29.ProfileRepository>(), get<_i6.AuthService>()));
  gh.factory<_i51.GetProductCubit>(() => _i51.GetProductCubit(
      get<_i27.ProductsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i52.GetProfileCubit>(() => _i52.GetProfileCubit(
      get<_i29.ProfileRepository>(), get<_i6.AuthService>()));
  gh.factory<_i53.HookaProduct>(
      () => _i53.HookaProduct(get<_i51.GetProductCubit>()));
  gh.factory<_i54.InviteBuddies>(
      () => _i54.InviteBuddies(get<_i43.BuddiesCubit>()));
  gh.factory<_i55.LoginCubit>(() =>
      _i55.LoginCubit(get<_i21.LoginRepository>(), get<_i6.AuthService>()));
  gh.factory<_i56.OffersCubit>(() =>
      _i56.OffersCubit(get<_i22.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i57.OffersDetailsCubit>(() => _i57.OffersDetailsCubit(
      get<_i22.OffersRepository>(), get<_i6.AuthService>()));
  gh.factory<_i58.OffersDetailsScreen>(
      () => _i58.OffersDetailsScreen(get<_i57.OffersDetailsCubit>()));
  gh.factory<_i59.OrderDetails>(
      () => _i59.OrderDetails(get<_i49.DetailsOrderCubit>()));
  gh.factory<_i60.OrderModule>(
      () => _i60.OrderModule(get<_i13.MyOrder>(), get<_i59.OrderDetails>()));
  gh.factory<_i61.PlacesCubit>(() =>
      _i61.PlacesCubit(get<_i26.PlacesRepository>(), get<_i6.AuthService>()));
  gh.factory<_i62.PlacesDetails>(
      () => _i62.PlacesDetails(get<_i48.DetailsCubit>()));
  gh.factory<_i63.ProdDetailsCubit>(() => _i63.ProdDetailsCubit(
      get<_i27.ProductsRepository>(), get<_i6.AuthService>()));
  gh.factory<_i64.Profile>(() => _i64.Profile(get<_i52.GetProfileCubit>()));
  gh.factory<_i65.ScreenContactus>(
      () => _i65.ScreenContactus(get<_i45.ContactUsCubit>()));
  gh.factory<_i66.SentDetails>(
      () => _i66.SentDetails(get<_i32.SentInvitationCubit>()));
  gh.factory<_i67.SettingCubit>(() =>
      _i67.SettingCubit(get<_i34.SettingRepository>(), get<_i6.AuthService>()));
  gh.factory<_i68.Settings>(() => _i68.Settings(get<_i67.SettingCubit>()));
  gh.factory<_i69.loginScreen>(
      () => _i69.loginScreen(cubit: get<_i55.LoginCubit>()));
  gh.factory<_i70.AuthModule>(() => _i70.AuthModule(get<_i69.loginScreen>(),
      get<_i36.SignupScreen>(), get<_i25.PinCodeVerificationScreen>()));
  gh.factory<_i71.BasketModule>(
      () => _i71.BasketModule(get<_i42.BasketScreen>()));
  gh.factory<_i72.Buddies>(() => _i72.Buddies(get<_i43.BuddiesCubit>()));
  gh.factory<_i73.BuddiesModule>(() => _i73.BuddiesModule(get<_i72.Buddies>(),
      get<_i54.InviteBuddies>(), get<_i38.ViewProfileBuddie>()));
  gh.factory<_i74.Checkout>(() => _i74.Checkout(get<_i44.CheckoutCubit>()));
  gh.factory<_i75.CheckoutModule>(
      () => _i75.CheckoutModule(get<_i74.Checkout>()));
  gh.factory<_i76.ContactUsSModule>(
      () => _i76.ContactUsSModule(get<_i65.ScreenContactus>()));
  gh.factory<_i77.DetailsInvModule>(
      () => _i77.DetailsInvModule(get<_i66.SentDetails>()));
  gh.factory<_i78.DetailsProduct>(
      () => _i78.DetailsProduct(get<_i63.ProdDetailsCubit>()));
  gh.factory<_i79.EditProfile>(
      () => _i79.EditProfile(get<_i50.GetEditProfileCubit>()));
  gh.factory<_i80.HookaPlaces>(() => _i80.HookaPlaces(get<_i61.PlacesCubit>()));
  gh.factory<_i81.Offers>(() => _i81.Offers(get<_i56.OffersCubit>()));
  gh.factory<_i82.OffersModule>(() =>
      _i82.OffersModule(get<_i81.Offers>(), get<_i58.OffersDetailsScreen>()));
  gh.factory<_i83.PlacesModule>(() =>
      _i83.PlacesModule(get<_i80.HookaPlaces>(), get<_i62.PlacesDetails>()));
  gh.factory<_i84.ProductModule>(() =>
      _i84.ProductModule(get<_i53.HookaProduct>(), get<_i78.DetailsProduct>()));
  gh.factory<_i85.ProfileModule>(
      () => _i85.ProfileModule(get<_i64.Profile>(), get<_i79.EditProfile>()));
  gh.factory<_i86.SettingModule>(
      () => _i86.SettingModule(get<_i68.Settings>(), get<_i3.About>()));
  gh.factory<_i87.MyApp>(() => _i87.MyApp(
      get<_i11.LocalizationService>(),
      get<_i70.AuthModule>(),
      get<_i37.SplashModule>(),
      get<_i8.HomeModule>(),
      get<_i83.PlacesModule>(),
      get<_i60.OrderModule>(),
      get<_i73.BuddiesModule>(),
      get<_i82.OffersModule>(),
      get<_i86.SettingModule>(),
      get<_i76.ContactUsSModule>(),
      get<_i84.ProductModule>(),
      get<_i85.ProfileModule>(),
      get<_i77.DetailsInvModule>(),
      get<_i71.BasketModule>(),
      get<_i75.CheckoutModule>()));
  return get;
}
