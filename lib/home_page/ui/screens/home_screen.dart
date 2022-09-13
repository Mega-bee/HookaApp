import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/Hooka%20Basket/basket_routes.dart';
import 'package:hooka/home_page/ui/widget/hooka_card.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:hooka/hooka_buddies/buddies_routes.dart';
import 'package:hooka/hooka_places/places_routes.dart';
import 'package:hooka/hooka_product/product_routes.dart';
import 'package:hooka/offers/offers_routes.dart';
import 'package:hooka/services/fire_notification_services.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:injectable/injectable.dart';

import '../../request/firebase_request.dart';
import '../../state_manager/firebase_state_manager.dart';

@injectable
class HomeScreen extends StatefulWidget {
  final FirebaseCubit cubit;
  HomeScreen(this.cubit);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  static FireNotificationService fireNotificationService =FireNotificationService();
  @override
  void initState() {

    super.initState();
    String FirebaseToken = '';
      fireNotificationService.GetFireBaseToken().then((tokenFire) {
        FirebaseToken = tokenFire ?? '';

        widget.cubit.FireBasee(this, FireRequest(token: FirebaseToken));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      decoration: BoxDecoration(

        gradient: LinearGradient(
          colors: [
            Colors.white,
            Color.fromRGBO(211,211,211, 0.9),
          ],
          begin:  FractionalOffset(0.0, 0.0),
          end:  FractionalOffset(0.0, 1.0),
          stops: [0.4, 1.0],
          tileMode: TileMode.repeated,

        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            elevation: 0,
            title: Text(
              "Hookapp",
                style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold)
            ),
            backgroundColor: Colors.white,
            leading: MenuWidget(),
            actions: [
              // IconButton(
              //     onPressed: () {},
              //     icon: Icon(
              //       Icons.notifications,
              //       color: Colors.black,
              //     )),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BasketRoutes.BasketS);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  )),
              // OfflineBuilder(
              //   connectivityBuilder: (
              //     BuildContext context,
              //     ConnectivityResult connectivity,
              //     Widget child,
              //   ) {
              //     final bool connected = connectivity != ConnectivityResult.none;
              //     return new Stack(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(18.0),
              //           child: Container(
              //             width: 50,
              //             height: 20,
              //             color: Colors.transparent,
              //             child: Center(
              //               child: connected
              //                   ? Text(
              //                       'Online',
              //                       style: TextStyle(
              //                           color: YellowColor,
              //                           fontWeight: FontWeight.bold,
              //                           decoration: TextDecoration.underline),
              //                     )
              //                   : Text('Offline',
              //                       style: TextStyle(
              //                           color: Color(0xFFEE4400),
              //                           fontWeight: FontWeight.bold,
              //                           decoration: TextDecoration.lineThrough)),
              //             ),
              //           ),
              //         ),
              //       ],
              //     );
              //   },
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       new Text(
              //         'There are no bottons to push :)',
              //       ),
              //       new Text(
              //         'Just turn off your internet.',
              //       ),
              //     ],
              //   ),
              // ),
            ]),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

            Image.asset(
              ImageAsset.HOMEIMAGE,
              height: 200,
              width: 500,
              fit: BoxFit.cover,
            ),
            Image.asset(
              ImageAsset.LOGO,
              height: 200,
              width: 500,
              fit: BoxFit.cover,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              HookaCard(
                  image: ImageAsset.PLACES,
                  onCardTap: () {
                    Navigator.pushNamed(context, PlacesRoutes.Places);
                  },
                  text: "HOOKA PLACES"),
              HookaCard(
                  image: ImageAsset.BUDDIES,
                  onCardTap: () {
                    Navigator.pushNamed(context, BuddiesRoutes.Buddies);
                  },
                  text: "HOOKA BUDDIES"),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              HookaCard(
                  image: ImageAsset.OFFER,
                  onCardTap: () {
                    Navigator.pushNamed(context, OffersRoutes.Offers);
                  },
                  text: "OFFERS"),
              HookaCard(
                  image: ImageAsset.PRODUCT,
                  onCardTap: () {
                    Navigator.pushNamed(context, ProductsRoutes.Product);
                  },
                  text: "Hooka product"),
            ]),
            SizedBox(

              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ]),
        ),
      ),
    );
  }
}
