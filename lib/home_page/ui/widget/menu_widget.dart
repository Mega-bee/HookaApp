import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatefulWidget {

  @override
  State<MenuWidget> createState() => MenuWidgetState();
}

class MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: ()=>
      ZoomDrawer.of(context)!.toggle()
    , icon:const Icon( Icons.menu,color: Colors.black),);
  }
}
