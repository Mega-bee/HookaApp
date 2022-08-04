import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooka/Hooka%20Basket/model/basket.dart';
import 'package:hooka/Hooka%20Basket/ui/widget/basket_card.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import '../../../utils/style/colors.dart';

class BasketScreen extends StatefulWidget {






  @override

  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  List<BasketModel> basketmodel=[
    // BasketModel(
    //   id: 1,
    //   increment: 0,
    //   incprice: Product().getPrice() ,
    //   bcp: 0,
    //   image: Product().getImage(),
    // ),
    // BasketModel(
    //   id: 2,
    //   increment: 0,
    //   incprice: Product().getPrice(),
    //   bcp: 0,
    //   image: Product().getImage(),
    // ),
    // BasketModel(
    //   id: 3,
    //   increment: 0,
    //   incprice: Product().getPrice(),
    //   bcp: 0,
    //   image: Product().getImage(),
    // ),

  ];
  num Total1 =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
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
            "Hooka Basket",
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
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
                    "assets/images/basket.jpeg",
                    fit: BoxFit.cover,
                    height: 400,
                    width: 700,
                  )),
                );
              }),
          SizedBox(
            height: 40,
          ),
      Expanded(
        child: Container(
        width: MediaQuery.of(context).size.width*0.9,

          child: ListView.builder(
              itemCount:basketmodel.length,
              itemBuilder: (context, index) {
                return BasketCard(
                  basketmodel[index],(){
                  Total1=0;
    basketmodel.forEach((basketModel) {

       Total1+= basketModel.bcp;


      });
    setState(() {

    });
                }



                );



              }),
        ),
        ),

          // Container(
          //   width: 300,
          //   height: 100,
          //   child: Card(
          //     elevation: 8,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(40.0),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Image.asset(
          //             "assets/images/shisha.png",
          //             width: 50,
          //           ),
          //           Container(
          //             width: 40,
          //             height: 40,
          //             child: InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   if (increment > 0)
          //                     increment--;
          //                   else
          //                     increment = 0;
          //                 });
          //               },
          //               child: Card(
          //                   color: Colors.grey[200],
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(40.0),
          //                   ),
          //                   child: Center(
          //                       child: Text(
          //                     "-",
          //                     style: TextStyle(fontWeight: FontWeight.bold),
          //                   ))),
          //             ),
          //           ),
          //           Text(
          //             "${increment}",
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //           Container(
          //             width: 40,
          //             height: 40,
          //             child: InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   increment++;
          //                 });
          //               },
          //               child: Card(
          //                   color: Colors.grey[200],
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(40.0),
          //                   ),
          //                   child: Center(child: Text("+"))),
          //             ),
          //           ),
          //           Text("USD $icp",
          //               style: TextStyle(fontWeight: FontWeight.bold))
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 40,
          // ),
          // Container(
          //   width: 300,
          //   height: 100,
          //   child: Card(
          //     elevation: 8,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(40.0),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Image.asset(
          //             "assets/images/shisha.png",
          //             width: 50,
          //           ),
          //           Container(
          //             width: 40,
          //             height: 40,
          //             child: InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   if (increment2 > 0)
          //                     increment2--;
          //                   else
          //                     increment2 = 0;
          //                 });
          //               },
          //               child: Card(
          //                   color: Colors.grey[200],
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(40.0),
          //                   ),
          //                   child: Center(
          //                       child: Text(
          //                     "-",
          //                     style: TextStyle(fontWeight: FontWeight.bold),
          //                   ))),
          //             ),
          //           ),
          //           Text(
          //             "${increment2}",
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //           Container(
          //             width: 40,
          //             height: 40,
          //             child: InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   increment2++;
          //                 });
          //               },
          //               child: Card(
          //                   color: Colors.grey[200],
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(40.0),
          //                   ),
          //                   child: Center(child: Text("+"))),
          //             ),
          //           ),
          //           Text("USD $icp2",
          //               style: TextStyle(fontWeight: FontWeight.bold))
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 40,
          // ),
          // Container(
          //   width: 300,
          //   height: 100,
          //   child: Card(
          //     elevation: 8,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(40.0),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Image.asset(
          //             "assets/images/shisha.png",
          //             width: 50,
          //           ),
          //           Container(
          //             width: 40,
          //             height: 40,
          //             child: InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   if (increment3 > 0)
          //                     increment3--;
          //                   else
          //                     increment3 = 0;
          //                 });
          //               },
          //               child: Card(
          //                   color: Colors.grey[200],
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(40.0),
          //                   ),
          //                   child: Center(
          //                       child: Text(
          //                     "-",
          //                     style: TextStyle(fontWeight: FontWeight.bold),
          //                   ))),
          //             ),
          //           ),
          //           Text(
          //             "${increment3}",
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //           Container(
          //             width: 40,
          //             height: 40,
          //             child: InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   increment3++;
          //                 });
          //               },
          //               child: Card(
          //                   color: Colors.grey[200],
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(40.0),
          //                   ),
          //                   child: Center(child: Text("+"))),
          //             ),
          //           ),
          //           Text("USD $icp3",
          //               style: TextStyle(fontWeight: FontWeight.bold))
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: Text(
              "TOTAL : USD ${Total1}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              width: 100,
              height: 50,
              child: Card(
                  color: Colors.black,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "Buy Now (3)",
                        style: TextStyle(color: YellowColor, fontSize: 12),
                      )))))
        ],
      ),
    );
  }
}
