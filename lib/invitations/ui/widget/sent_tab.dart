import 'package:flutter/material.dart';
import 'package:hooka/invitations/ui/widget/sent_card.dart';

class SentTab extends StatefulWidget {
  const SentTab({Key? key}) : super(key: key);

  @override
  State<SentTab> createState() => _SentTabState();
}

class _SentTabState extends State<SentTab> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
    Expanded(
    child: Card(

    child: ListView.builder(
    itemCount: 1,
    itemBuilder: (context, index) {
      return SentCard();
    })))]

    );
  }
}
