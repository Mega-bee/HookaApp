import 'package:flutter/material.dart';

import 'package:hooka/home_page/ui/widget/menu_widget.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("MyCart",style: TextStyle(color: Colors.black),),

      ),
      body: Center(child: Text("hello")),
    );
  }
}
