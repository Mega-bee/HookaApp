// import 'package:flutter/material.dart';
// import 'package:expansion_tile_card/expansion_tile_card.dart';
//
// import '../../response/profile_response.dart';
//
// class CardProfile extends StatefulWidget {
// final Experience   cardModel;
//
// CardProfile(this.cardModel);
//   @override
//   State<CardProfile> createState() => _CardProfileState();
// }
//
// class _CardProfileState extends State<CardProfile> {
//   final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
//   final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//       ),
//     );
//     return
//       Container(
//       child:  Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//         child: ExpansionTileCard(
//           key: cardA,
//           leading: CircleAvatar(child: Text(widget.cardModel.place.toString())),
//           title: Text('Tap me!'),
//           subtitle: Text('I expand!'),
//           children: <Widget>[
//             Divider(
//               thickness: 1.0,
//               height: 1.0,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16.0,
//                   vertical: 8.0,
//                 ),
//                 child: Text(
//                   """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.
//
// Use me any time you think your app could benefit from being just a bit more Material.
//
// These buttons control the next card down!""",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyText2!
//                       .copyWith(fontSize: 16),
//                 ),
//               ),
//             ),
//             ButtonBar(
//               alignment: MainAxisAlignment.spaceAround,
//               buttonHeight: 52.0,
//               buttonMinWidth: 90.0,
//               children: <Widget>[
//                 TextButton(
//                   style: flatButtonStyle,
//                   onPressed: () {
//                     cardB.currentState?.expand();
//                   },
//                   child: Column(
//                     children: <Widget>[
//                       Icon(Icons.arrow_downward),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2.0),
//                       ),
//                       Text('Open'),
//                     ],
//                   ),
//                 ),
//                 TextButton(
//                   style: flatButtonStyle,
//                   onPressed: () {
//                     cardB.currentState?.collapse();
//                   },
//                   child: Column(
//                     children: <Widget>[
//                       Icon(Icons.arrow_upward),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2.0),
//                       ),
//                       Text('Close'),
//                     ],
//                   ),
//                 ),
//                 TextButton(
//                   style: flatButtonStyle,
//                   onPressed: () {
//                     cardB.currentState?.toggleExpansion();
//                   },
//                   child: Column(
//                     children: <Widget>[
//                       Icon(Icons.swap_vert),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2.0),
//                       ),
//                       Text('Toggle'),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//
//     );
//   }
// }
