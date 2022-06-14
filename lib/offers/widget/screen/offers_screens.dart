import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import '../../../utils/images/images.dart';
import '../../../utils/style/colors.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
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
              Icons.share,
              color: Primarycolor,
              size: 25,
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
                                    fontSize:18, color: Colors.white)))),
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
                child: Text("Offer",
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.095,
              width: MediaQuery.of(context).size.width*0.8,
              child: Card(
                elevation: 4,
shadowColor: Colors.red[100],
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [  Column(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("type"),
    ),
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Hooka",style: TextStyle(fontWeight: FontWeight.bold),),
    ),
  ],),
     Padding(
        padding: EdgeInsets.only(right: 2, left: 24),
        child: Container(
          color: Colors.black,
          height: 50,
          width: 1,
        ),
      ),

    Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Discount"),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("35%",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    ],),
    Padding(
      padding: EdgeInsets.only(right: 2, left: 24),
      child: Container(
        color: Colors.black,
        height: 50,
        width: 1,
      ),
    ),
    Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Expiry Date"),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("25 June 2022",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    ],),
]),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            ElevatedButton(
              onPressed: () {},
//

              child: const Text(
                'BOOK ',
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



          ],
        ),
      ),
    );
  }
}
