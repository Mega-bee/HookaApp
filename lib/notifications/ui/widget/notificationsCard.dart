import 'package:flutter/material.dart';

import '../../../utils/style/colors.dart';

class Notificationscard extends StatefulWidget {
  const Notificationscard({Key? key}) : super(key: key);

  @override
  State<Notificationscard> createState() => _NotificationscardState();
}

class _NotificationscardState extends State<Notificationscard> {
  @override
  Widget build(BuildContext context) {
    return Card(
elevation: 2,
     shadowColor: YellowColor,
      child: Column(
        children: [Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width:MediaQuery.of(context).size.width*0.12,

                    child: CircleAvatar(
                      foregroundImage: AssetImage("assets/images/hooka_logo.png",),
                      radius:120,

                      backgroundColor: YellowColor,
                    ),
                    // Text("C",style: TextStyle(fontSize: 50,color: Colors.white),),)
                  )),

              Text("Thank You For using Hooka App"),
            ] ),
          Text(DateTime.now().toString().split("1").first,style: TextStyle(color: Colors.grey,fontSize: 10)),
SizedBox(height: 25,),
        ]),
    );
  }
}
