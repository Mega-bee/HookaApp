import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../profile/ui/profile.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../Model/BuddiesModel.dart';
import '../screens/view_profile.dart';

class BuddiesCard extends StatelessWidget {
  final BuddiesModel buddiesModel;

  const BuddiesCard(this.buddiesModel);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      GestureDetector(
        onTap: () =>
        {
        },
        child: Row(
            children: [
              Stack(
                children:[


                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Center(
                      child: Card(elevation:10,
                        shadowColor: YellowColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)),

                        child: CircleAvatar(
                          foregroundImage: AssetImage("${buddiesModel.BuddiesImage}"),
                          radius:120,
                          backgroundColor: Colors.red,

                        ),
                      ),

                    )),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,top: 60,left: 20),
                    child: Card(color: YellowColor,child: Center(child: Text(
                     " ${buddiesModel.rank}",
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),)),
                      elevation: 2,shadowColor: YellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10
                        ),
                      ),
                    ),
                  ),
              ]),

              Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                      children:[
                        SizedBox(width: MediaQuery.of(context).size.width*0.43,),
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 12,
                        ),

                        Text("${buddiesModel.available}",
                          style: TextStyle(color: Colors.grey[600],
                              fontSize: 12, fontWeight: FontWeight.bold)),
                  ]),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                     Padding(
                       padding: const EdgeInsets.only(left: 20,right:100),
                       child: Text("${buddiesModel.name}",
                              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
                     ),


                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         color:YellowColor,
                         height: MediaQuery.of(context).size.height*0.03,
                         width: MediaQuery.of(context).size.width*0.25,
                         child: Center(child: Text("invite")),
                       ),
                       SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                       InkWell(
                         onTap: (){
                           Navigator.push(
                               context, CustomPageRoute(child: ViewProfile()));
                         },
                         child: Container(
                           color:Primarycolor,
                           height: MediaQuery.of(context).size.height*0.03,
                           width: MediaQuery.of(context).size.width*0.25,
                           child: Center(child: Text("View Profile",style: TextStyle(color: YellowColor),)),
                         ),
                       )
                     ],
                   ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                  ]),


            ]),),

      Divider(color: Colors.grey, thickness: 0),

    ],
    );
  }
  }

