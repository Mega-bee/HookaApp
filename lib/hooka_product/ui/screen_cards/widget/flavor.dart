import 'package:flutter/material.dart';
import 'package:hooka/utils/images/images.dart';

class Flavor{
  final String? title;
  final AssetImage? image;
  const Flavor({ this.title, this.image});

}
List Flavors  =[
"${Flavor(image:AssetImage('assets/images/apple.png'),title: 'Apple')}",
"${Flavor(image:AssetImage('assets/images/bubble gum.png'),title: 'Bubble Gum')}",
"${Flavor(image:AssetImage('assets/images/grape mint.png'),title: 'Grip Mint')}",
"${Flavor(image:AssetImage('assets/images/lemon mint.png'),title: 'Lemon Mint')}",
"${Flavor(image:AssetImage('assets/images/mint.png'),title: 'Mint')}",
"${Flavor(image:AssetImage('assets/images/peach.png'),title: 'Peach')}"];



