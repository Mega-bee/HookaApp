import 'package:hive/hive.dart';
class HookaAccessorieModel{
  late String name;
 late String image;
  late double price;
  HookaAccessorieModel({required this.name,required this.image,required this.price});
}
List <HookaAccessorieModel> AccessorieList = [
  HookaAccessorieModel(
    name: "Hooka Witty",
    image: "assets/images/delora.jpeg",
    price: 30,
  ),
  HookaAccessorieModel(
    name: "Hooka Witty",
    image: "assets/images/hooka2.png",
    price: 40 ,
  ),HookaAccessorieModel(
    name: "Hooka Witty",
    image: "assets/images/exotic.png",
    price: 50 ,
  ),HookaAccessorieModel(
    name: "Hooka Witty",
    image: "assets/images/Hookawitty.png",
    price: 30 ,
  ),HookaAccessorieModel(
    name: "Hooka Witty",
    image: "assets/images/IMG_0095.JPG",
    price: 20 ,
  ),
  HookaAccessorieModel(
    name: "Hooka Witty",
    image: "assets/images/IMG_0095.JPG",
    price: 10 ,
  ),
  HookaAccessorieModel(
    name: "Hooka Witty",
    image: "assets/images/IMG_0095.JPG",
    price: 50 ,
  ),
];