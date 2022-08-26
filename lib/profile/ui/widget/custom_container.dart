import 'package:flutter/material.dart';

class ContainerRow extends StatelessWidget {
  final String title;
  final String body;


  ContainerRow(this.title,this.body ,);

  @override
  Widget build(BuildContext context) {
    return   Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 40  ,top: 3 ,end: 40, bottom: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(fontSize: 18),),

            Text(body,style: TextStyle(fontSize: 16),)
          ],),
      ),
    );
  }
}

