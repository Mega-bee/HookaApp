import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooka/abstracts/module/rout_module.dart';
import 'package:hooka/address/address_module.dart';
import 'package:hooka/auth/HiveSetUp.dart';
import 'package:hooka/auth/auth_module.dart';
import 'package:hooka/di/di_config.dart';
import 'package:hooka/generated/l10n.dart';
import 'package:hooka/global_nav_key.dart';
import 'package:hooka/home_page/home_module.dart';
import 'package:hooka/hooka_buddies/buddies_module.dart';
import 'package:hooka/localization_service/localizationSservice.dart';
import 'package:hooka/offers/offers_module.dart';
import 'package:hooka/profile/profile_module.dart';
import 'package:hooka/services/fire_notification_services.dart';
import 'package:hooka/services/local_notification_service.dart';
import 'package:hooka/settings/setting_module.dart';
import 'package:hooka/splash_screen/splash_module.dart';
import 'package:hooka/splash_screen/splash_routes.dart';
import 'package:hooka/utils/logger/logger.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:injectable/injectable.dart';
import 'Hooka Basket/basket_module.dart';
import 'checkout/checkout_module.dart';
import 'contact_us/contactus_module.dart';
import 'firebase_options.dart';
import 'hooka_places/places_module.dart';
import 'hooka_product/product_module.dart';
import 'invitations/details_module.dart';
import 'map/map_module.dart';
import 'my_orders/order_module.dart';
import 'notifications/notification_module.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await HiveSetUp.init();

//  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
//  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    runZonedGuarded(() {
      configureDependencies();

      // Your App Here
      runApp(getIt<MyApp>());
    }, (error, stackTrace) {
      Logger().error(
          'Main', error.toString() + stackTrace.toString(), StackTrace.current);
    });
  });
}

@injectable
class MyApp extends StatefulWidget {
//  final AppThemeDataService _themeDataService;
  final LocalizationService _localizationService;
  final SplashModule _splashModule;
  final AuthModule _authModule;
  final HomeModule _homeModule;
  final PlacesModule _placesModule;
  final BuddiesModule _buddiesModule;
  final OffersModule _offersModule;
  final SettingModule _settingModule;
  final ContactUsSModule _contactUsModule;
  final ProductModule _productModule;
  final ProfileModule _profileModule;
  final DetailsInvModule _detailsInvModule;
  final BasketModule _basketModule;
  final CheckoutModule _checkoutModule;
  final OrderModule _orderModule;
  final AddressModule _addressModule;
  final NotificationsModule _notificationsModule;
  final MapModule _mapModule;

  MyApp(
//    this._themeDataService,
      this._localizationService,
      this._authModule,
      this._splashModule,
      this._homeModule,
      this._placesModule,
      this._orderModule,
      this._buddiesModule,
      this._offersModule,
      this._settingModule,
      this._contactUsModule,
      this._productModule,
      this._profileModule,
      this._detailsInvModule,
      this._basketModule,
      this._checkoutModule,
      this._addressModule,
      this._notificationsModule,
      this._mapModule);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocalNotificationService localNotificationService =
      LocalNotificationService();
  static FireNotificationService fireNotificationService =
      FireNotificationService();

//  late ThemeData activeThem;
//  late String lang;

  @override
  Widget build(BuildContext context) {
    return getConfiguredApp(RoutModule.RoutesMap);
  }

  Widget getConfiguredApp(
    Map<String, WidgetBuilder> fullRoutesList,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      theme: activeThem,

      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Hooka',
      routes: fullRoutesList,
      theme: ThemeData(
        bottomAppBarColor: Colors.black,
        primaryColor: YellowColor,
        accentColor: Colors.black,
        accentColorBrightness: Brightness.light,
        hoverColor: Colors.black,
        colorScheme: ColorScheme.light(
          primary: Colors.black,
        ),
      ),
      initialRoute: SplashRoutes.SPLASH_SCREEN,
      key: GlobalVariable.mainScreenScaffold,

    );
  }

  @override
  void initState() {
    fireNotificationService = FireNotificationService();

    fireNotificationService.init();

    localNotificationService.init();

    localNotificationService.onLocalNotificationStream.listen((event) {
      setState(() {});
    });
    fireNotificationService.onNotificationStream.listen((event) {
      localNotificationService.showNotification(event);
    });
//    activeThem = widget._themeDataService.getActiveTheme();
//    widget._themeDataService.darkModeStream.listen((event) {
//      activeThem = event;
//      setState(() {});
//    });
//    // widget._localizationService= LocalizationService();
//    lang = widget._localizationService.getLanguage();
//
//    widget._localizationService.localizationStream.listen((event) {
//      print(event);
//      lang = event;
//      setState(() {});
//    });
  }
}
