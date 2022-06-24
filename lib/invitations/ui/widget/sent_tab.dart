import 'package:flutter/material.dart';
import 'package:hooka/invitations/ui/widget/sent_card.dart';

import '../../model/sent_model.dart';

class SentTab extends StatefulWidget {

  List <SentModel> smod=[
    SentModel(
      id: 1,
      title: "King Of Grill",
      image:"assets/images/Unknown.jpeg",
      buddies: "20 Buddies",
      rate: "2.2"
    ),
    SentModel(
      id: 2,
      title: "Malik TAwouk",
      image:"assets/images/malik tawouk.png",
      buddies: "50 Buddies",
      rate: "3.5"
    ),
    SentModel(
      id: 3,
      title: "Macdonald's",
      image:"assets/images/macdo.jpeg",
      buddies: "70 Buddies",
        rate: "5.0"
    ),
    SentModel(
      id: 4,
      title: "Burger King",
      image:"assets/images/burger king.webp",
      buddies: "21 Buddies",
      rate: "3.5",
    ),
    SentModel(
      id: 5,
      title: "King Of Grill",
      image:"assets/images/Unknown.jpeg",
      buddies: "22 Buddies",
        rate: "2.5"
    ),
    SentModel(
      id: 6,
      title: "King Of Grill",
      image:"assets/images/Unknown.jpeg",
      buddies: "12 Buddies",
        rate: "1.5"
    ),
    SentModel(
      id: 7,
      title: "King Of Grill",
      image:"assets/images/Unknown.jpeg",
      buddies: "52 Buddies",
      rate: "3.1"
    )
  ];
  @override
  State<SentTab> createState() => _SentTabState();
}

class _SentTabState extends State<SentTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
      Expanded(
        flex: 100,
      child: Card(

      child: ListView.builder(
      itemCount: widget.smod.length,
      itemBuilder: (context, index) {
        return SentCard(sentModel: widget.smod[index],);
      })))]

      ),
    );
  }
}
