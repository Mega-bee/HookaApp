import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import '../../../../utils/style/colors.dart';
import '../widget/flavor.dart';
class HookaCapsules extends StatefulWidget {
  List title=[
    "Apple",
    "Bubble Gum",
    "Grape Mint",
    "Lemon Mint",
    "Mint",
    "Peach",

  ];
  List Image  =[
    'assets/images/apple.png',
    'assets/images/bubble gum.png',
    'assets/images/grape mint.png',
    'assets/images/lemon mint.png',
    'assets/images/mint.png',
    'assets/images/peach.png'];

  @override
  State<HookaCapsules> createState() => _HookaCapsulesState();
}

class _HookaCapsulesState extends State<HookaCapsules> {

  @override
  Widget build(BuildContext context) {
    bool _selected= false;
    List <Flavor> SelectedFilter1Cards = [];
    return Scaffold(
      backgroundColor: Colors.white,
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
          "My Capsules",
          style: TextStyle(color: Primarycolor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Primarycolor,
              size: 30,
            ),
            onPressed: () {},
          ),
          TextButton(onPressed: (){}, child: Text("Add ons"))
        ],
      ),
      body:

      SingleChildScrollView(
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
                          "assets/images/Cool-dad.jpg",
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
                  Text("Hooka Capsules",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

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
                child: Text("75.000 LBP",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
                child: Text("Choose Flavor",
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),




            Container(
              height:MediaQuery.of(context).size.height*0.12,
              width:400,
              color: Colors.transparent,
              child: ListView.separated(
                scrollDirection:Axis.horizontal ,
                shrinkWrap: true,


                itemCount: 6,
                itemBuilder: (BuildContext context,int index) {
                  return Container(

                    color: Colors.transparent,
                    child: Column(
                        children:[

                          InkWell(
                            onTap:(){
                              setState(() {
                                if(Flavors[index].isSelected==true){
                                  SelectedFilter1Cards.add(
                                      Flavor(
                                          isSelected:true )
                                  );}
                                else if(Flavors[index].isSelected==false){
                                  SelectedFilter1Cards.removeWhere((element) => element.title == Flavors[index].Type);
                                }
                              });

                            },
                            child: Card(
                                color: Colors.transparent,
                                shadowColor: Colors.transparent,
                                child: Image.asset("${widget.Image[index]}",width: 90,height: 50,)),
                          ),


                          Text(widget.title[index],
                              style: TextStyle(color: !_selected
                                  ? Colors.red
                                  : Colors.black,
                              ))]),
                  );
                }, separatorBuilder: (BuildContext context, int index) { return const Divider(
                color: Colors.grey,
              ); },),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
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
                child: Text("The Hooka Times Capsules is a smart convenient solution\n"
                    "for those who wish to enjoy our high-quality product\n"
                    "in the comfort of their own homes or with friends. ",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),


          ],
        ),
      ),
    );

  }

}

