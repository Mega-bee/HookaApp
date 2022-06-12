import 'package:flutter/material.dart';
import '../../../hooka_places/ui/screen/hooka_places.dart';
import '../../../hooka_product/ui/screen/hooka_product.dart';
import 'package:hooka/home_page/ui/widget/hooka_card.dart';
import 'package:hooka/utils/images/images.dart';

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
        appBar: AppBar(
          elevation: 0,
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
          ],
        ),
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
                  onCardTap: () {},
                  text: "HOOKA BUDDIES"),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              HookaCard(
                  image: ImageAsset.OFFER, onCardTap: () {}, text: "OFFERS"),
              HookaCard(
                  image: ImageAsset.PRODUCT,
                  onCardTap: () {
                    Navigator.push(
                        context, CustomPageRoute(child: HookaProduct()));
                  },
                  text: "Hooka product"),
            ]),
          ]),
        ));
  }
}
