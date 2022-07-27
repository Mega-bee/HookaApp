import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../utils/style/colors.dart';

class Notificationscard extends StatefulWidget {
  const Notificationscard({Key? key}) : super(key: key);

  @override
  State<Notificationscard> createState() => _NotificationscardState();
}

class _NotificationscardState extends State<Notificationscard> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
        // Specify a key if the Slidable is dismissible.
        key: const ValueKey(0),
    // The start action pane is the one at the left or the top side.
    endActionPane: ActionPane(
    // A motion is a widget used to control how the pane animates.
    motion: const ScrollMotion(),
    // A pane can dismiss the Slidable.
    dismissible:
    DismissiblePane(onDismissed: () {}),
    children: [
    // A SlidableAction can have an icon and/or a label.
    // SlidableAction(
    // onPressed: (BuildContext context) {},
    // backgroundColor: Color(0xFF126CF2),
    // foregroundColor: Colors.white,
    // icon: Icons.done_rounded,
    // ),
    SlidableAction(
    onPressed: (BuildContext context) {},
    backgroundColor: const Color(0xFFED0B19),
    foregroundColor: Colors.white,
    icon: Icons.close,
    ),
    ],
    ),
    child: Card(
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
    ));
  }
}
