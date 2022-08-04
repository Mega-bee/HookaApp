import 'package:flutter/material.dart';
// import 'package:hooka/Hive/Hive.dart';
import '../../Model/HookaAccessorieModel.dart';
class HookaAccessorieCard extends StatefulWidget {
   final HookaAccessorieModel hookaAccessorieModel;
  HookaAccessorieCard(this.hookaAccessorieModel,);
   @override
   State<HookaAccessorieCard> createState() => _HookaAccessorieCardState();
}

class _HookaAccessorieCardState extends State<HookaAccessorieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          // Product().setProduct(
          //     widget.hookaAccessorieModel.name,
          //     widget.hookaAccessorieModel.price,
          //     widget.hookaAccessorieModel.image
          // );
        },
        child:Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20,5,20,0),
    child: Column(
        children: [
          Container(
            child:
              Image.asset("${widget.hookaAccessorieModel.image}",fit: BoxFit.fill,),),
               SizedBox(height: 5,),
               Row(
                  children: [
                    Text("${widget.hookaAccessorieModel.name}",style: TextStyle(fontWeight: FontWeight.bold),),
                    Spacer(),
                    Text("USD ${widget.hookaAccessorieModel.price}")
                  ],
                ),
        ],
      ),
    )));
  }
}
