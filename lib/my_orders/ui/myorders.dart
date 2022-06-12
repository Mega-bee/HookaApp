import 'package:flutter/material.dart';

import 'package:hooka/home_page/ui/widget/menu_widget.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("MyOrders",style: TextStyle(color: Colors.black),),

      ),
      body: Center(child: Text("hello")),
    );
  }
}
