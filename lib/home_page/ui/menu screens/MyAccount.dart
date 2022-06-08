import 'package:flutter/material.dart';

import '../widget/menu_widget.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("MyAccount",style: TextStyle(color: Colors.black),),

      ),
      body: Center(child: Text("hello")),
    );
  }
}
