import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:hooka/home_page/ui/widget/hooka_card.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:hooka/hooka_buddies/buddies_routes.dart';
import 'package:hooka/hooka_places/places_routes.dart';
import 'package:hooka/hooka_product/ui/screen/hooka_product.dart';
import 'package:hooka/offers/offers_routes.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          title: Text(
            "Hookapp",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: MenuWidget(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                )),
            OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
              ) {
                final bool connected = connectivity != ConnectivityResult.none;
                return new Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        width: 50,
                        height: 20,
                        color: Colors.transparent,
                        child: Center(
                          child: connected
                              ? Text(
                                  'Online',
                                  style: TextStyle(
                                      color: YellowColor,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                )
                              : Text('Offline',
                                  style: TextStyle(
                                      color: Color(0xFFEE4400),
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough)),
                        ),
                      ),
                    ),
                  ],
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'There are no bottons to push :)',
                  ),
                  new Text(
                    'Just turn off your internet.',
                  ),
                ],
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Image.asset(
            ImageAsset.LOGO,
            height: 250,
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
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HookaProduct()));
                },
                text: "Hooka product"),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
        ]),
      ),
    );
  }
}
