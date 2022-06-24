import 'package:flutter/material.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:hooka/notifications/ui/widget/notificationsCard.dart';
import 'package:hooka/utils/style/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("Notifications",style: TextStyle(color: Colors.black),),

      ),
      body:Container(
        child: Column(children: [
          Expanded(
              flex: 100,
              child: Card(

                  child: ListView.builder(
                      itemCount:3 ,
                      itemBuilder: (context, index) {
                        return Notificationscard();
                      })))]

        ),
      ),

    );
  }
}
