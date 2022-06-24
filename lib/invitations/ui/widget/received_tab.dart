import 'package:flutter/material.dart';
import 'package:hooka/invitations/ui/widget/received_card.dart';

import '../../model/received_model.dart';


class ReceivedTab extends StatefulWidget {
List <ReceivedModel> rmod=[
  ReceivedModel(
    image:  "assets/images/IMG_0095.JPG",
    title:" Christian Zakhour",
    id: 1,

  ),
  ReceivedModel(
    image:   "assets/images/hooka_logo.png",
    title:"John Tohme     ",
    id: 2,

  )
  ,ReceivedModel(
    image:   "assets/images/hooka_logo.png",
    title:"Peter Tohme    ",
    id: 3,

  ),
  ReceivedModel(
    image:   "assets/images/hooka_logo.png",
    title:"Elon Musk     ",
    id: 4,

  )
];
  @override
  State<ReceivedTab> createState() => _ReceivedTabState();
}

class _ReceivedTabState extends State<ReceivedTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Expanded(
          flex: 100,
            child: Card(

                child: ListView.builder(
                    itemCount:widget.rmod.length ,
                    itemBuilder: (context, index) {
                      return ReceivedCard(
                        receivedModel: widget.rmod[index],
                      );
                    })))]

      ),
    );
  }
}