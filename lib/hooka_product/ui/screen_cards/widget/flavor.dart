import 'package:flutter/material.dart';
import 'package:hooka/utils/images/images.dart';

class Flavor{
  final String? title;
  final AssetImage? image;
  final bool isSelected;
  const Flavor({ this.title, this.image,required this.isSelected});

}
List Flavors  =[
"${Flavor(image:AssetImage('assets/images/apple.png'),title: 'Apple', isSelected: false)}",
"${Flavor(image:AssetImage('assets/images/bubble gum.png'),title: 'Bubble Gum', isSelected: false)}",
"${Flavor(image:AssetImage('assets/images/grape mint.png'),title: 'Grip Mint', isSelected: false)}",
"${Flavor(image:AssetImage('assets/images/lemon mint.png'),title: 'Lemon Mint', isSelected: false)}",
"${Flavor(image:AssetImage('assets/images/mint.png'),title: 'Mint', isSelected: false)}",
"${Flavor(image:AssetImage('assets/images/peach.png'),title: 'Peach', isSelected: false)}"];



