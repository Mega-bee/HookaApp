import 'package:flutter/material.dart';

import '../widget/menu_widget.dart';

class Contactus extends StatefulWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("ContactUs",style: TextStyle(color: Colors.black),),

      ),
      body: Center(child: Text("hello")),
    );
  }
}
