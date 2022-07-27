import 'package:flutter/material.dart';

import '../../../../utils/style/colors.dart';
import '../../Model/HookaAccessorieModel.dart';
import '../widget/HookaAccessorieCard.dart';
class HookaAccessories extends StatefulWidget {
  const HookaAccessories({Key? key}) : super(key: key);

  @override
  State<HookaAccessories> createState() => _HookaAccessoriesState();
}

class _HookaAccessoriesState extends State<HookaAccessories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
        icon: Icon(
        Icons.arrow_back_outlined,
        color: Primarycolor,
        size: 35,
    ),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
    title: Text(
    "My Accessories",
    style: TextStyle(color: Primarycolor),
    ),
    actions: [
    IconButton(
    icon: Icon(
    Icons.notifications,
    color: Primarycolor,
    size: 30,
    ),
    onPressed: () {},
    ),
    TextButton(onPressed: (){}, child: Text("Add ons"))
    ],
    ),
    body:

    SingleChildScrollView(
    child: Column(
    children: [
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.25,
        child: Image.asset("assets/images/IMG_0095.JPG",fit: BoxFit.fill,),
      ),
      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
      Padding(
          padding: EdgeInsets.only(left: 12),
      child:  Align(
        alignment: Alignment.centerLeft,
        child:Text("Our Products",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Primarycolor,)),
      ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
      Container(
        height: MediaQuery.of(context).size.height*0.65,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: AccessorieList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 62,
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
                child: HookaAccessorieCard(AccessorieList[index],)
            );
          }),
      ),])
    ));
  }
}
