import 'package:flutter/material.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';

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
      body: Center(child: Text("No notifications found !")),
    );
  }
}
