import 'package:flutter/material.dart';
import 'package:hooka/invitations/ui/widget/received_card.dart';


class ReceivedTab extends StatefulWidget {
  const ReceivedTab({Key? key}) : super(key: key);

  @override
  State<ReceivedTab> createState() => _ReceivedTabState();
}

class _ReceivedTabState extends State<ReceivedTab> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Card(

              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ReceivedCard();
                  })))]

    );
  }
}