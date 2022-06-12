import 'package:flutter/material.dart';
import 'package:hooka/utils/style/colors.dart';

class HookaCard extends StatelessWidget {
  final Function onCardTap;
  final String image;
  final String text;


  HookaCard({required this.onCardTap,required this.image,required this.text});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: () {
        onCardTap();
      },
      child: Card(
        color: AmberColor,
        child: Column(children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 100,
            width: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            child: Text(
             text,
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 15),
            ),
          )
        ]),
      ),
    );
  }
}
