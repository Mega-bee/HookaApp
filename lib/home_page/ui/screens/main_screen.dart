import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:hooka/buddies/ui/screens/buddies.dart';
import 'package:hooka/utils/style/colors.dart';
import '../../../hooka_places/ui/screen/hooka_places.dart';
import '../../../hooka_product/ui/screen/hooka_product.dart';
import 'package:hooka/home_page/ui/widget/hooka_card.dart';
import 'package:hooka/utils/images/images.dart';

import '../../../offers/widget/ui/offers.dart';
import '../../../otp/ui/screen/otp.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../widget/menu_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                onPressed: () {
                  Navigator.push(context, CustomPageRoute(child: PinCodeVerificationScreen()));
                },
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
                          child:
                          connected ?
                              Text('Online',style: TextStyle(color: YellowColor,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),):
                              Text('Offline',style: TextStyle(color:  Color(0xFFEE4400),fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough)),),
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
                  Navigator.push(
                      context, CustomPageRoute(child: HookaPlaces()));
                },
                text: "HOOKA PLACES"),
            HookaCard(
                image: ImageAsset.BUDDIES,
                onCardTap: () {
                  Navigator.push(context, CustomPageRoute(child: Buddies()));
                },
                text: "HOOKA BUDDIES"),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            HookaCard(
                image: ImageAsset.OFFER,
                onCardTap: () {
                  Navigator.push(context, CustomPageRoute(child: Offers()));
                },
                text: "OFFERS"),
            HookaCard(
                image: ImageAsset.PRODUCT,
                onCardTap: () {
                  Navigator.push(
                      context, CustomPageRoute(child: HookaProduct()));
                },
                text: "Hooka product"),

          ]),
          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
        ]),
      ),
    );
  }
}
