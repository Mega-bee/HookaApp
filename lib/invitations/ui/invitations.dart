import 'package:flutter/material.dart';

import 'package:hooka/home_page/ui/widget/menu_widget.dart';

class Invitations extends StatefulWidget {
  const Invitations({Key? key}) : super(key: key);

  @override
  State<Invitations> createState() => _InvitationsState();
}

class _InvitationsState extends State<Invitations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("Invitations",style: TextStyle(color: Colors.black),),

      ),
      body: Center(child: Text("hello")),
    );
  }
}
