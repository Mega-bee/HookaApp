import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooka/profile/ui/profile.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../hooka_product/ui/screen/hooka_product.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';

class PlacesDetails extends StatefulWidget {
  const PlacesDetails({Key? key}) : super(key: key);

  @override
  State<PlacesDetails> createState() => _PlacesDetailsState();
}

class _PlacesDetailsState extends State<PlacesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Primarycolor,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "King of Grill",
          style: TextStyle(color: Primarycolor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_on,
              color: Primarycolor,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlayAnimation<double>(
                duration: Duration(milliseconds: 1200),
                // delay: Duration(milliseconds: 400),
                tween: Tween(begin: 0.0, end: 250),
                builder: (context, child, value) {
                  return Container(
                    height: value,
                    child: Center(
                        child: Image.asset(
                      "assets/images/Unknown.jpeg",
                      fit: BoxFit.cover,
                      height: 600,
                    )),
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("King of Grill",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Container(
                    height: 30,
                    width: 70,
                    color: Colors.transparent,
                    child: Card(
                        color: Colors.green,
                        child: Center(
                            child: Text("2.78",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Bcharry",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 20,
                  width: 70,
                  color: Colors.red[50],
                  child: Center(
                    child: Text("lebanese",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(children: [
                  Icon(
                    FontAwesomeIcons.clock,
                    color: Colors.grey,
                    size: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Text("Opening hours [09:30Am -07:00Pm]",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                ]),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Container(
                color: Colors.grey,
                height: 1,
                width: MediaQuery.of(context).size.width * 0.82,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Description",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("King of Grill",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Favorite To",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Card(
                      color: YellowColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                          child: Icon(
                        FontAwesomeIcons.plus,
                        size: 25,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Card(
                      color: Colors.red,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                          child: Icon(
                        FontAwesomeIcons.c,
                        size: 25,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
              onPressed: () {},
//

              child: const Text(
                'INVITE BUDDY ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-Bold'),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: MediaQuery.of(context).size.height * 0.018),
                primary: YellowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Album",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(children: [
              Image.asset(
                ImageAsset.LOGO,
                height: 200,
                width: 200,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              Image.asset(
                ImageAsset.LOGO,
                height: 200,
                width: 200,
              )
            ])
          ],
        ),
      ),
    );
  }
}
