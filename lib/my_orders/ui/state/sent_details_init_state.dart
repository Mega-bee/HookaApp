//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import '../../../abstracts/states/state.dart';
// import '../../response/sent_details_response.dart';
// import '../screen/sent_details.dart';
// import '../widget/details_sent_card.dart';
//
// class DetailsSentInitState extends States {
//   final DetailsSentResponse detailsSentResponse;
//   final SentDetailsState sentDetailsState;
//   DetailsSentInitState(this.detailsSentResponse,this.sentDetailsState);
//   @override
//   Widget getUI(BuildContext context) {
// return SingleChildScrollView(
//
//   child:   Container(
//     height: 900,
//     child: Column(
//       children: [
//         SizedBox(height: 20,),
//         CachedNetworkImage(
//           imageUrl:detailsSentResponse.placeImage.toString(),
//           height: 130,
//           fit: BoxFit.cover,
//           imageBuilder: (context, imageProvider) => Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(80),
//               image: DecorationImage(
//                 image: imageProvider,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           placeholder: (context, url) => const Padding(
//             padding: EdgeInsets.all(15.0),
//             child: LoadingIndicator(
//               indicatorType: Indicator.ballBeat,
//               colors: [Colors.black],
//             ),
//           ),
//           errorWidget: (context, url, error) => Icon(Icons.error),
//         ),
//         SizedBox(height: 50,),
//         Padding(
//           padding: const EdgeInsets.all(28.0),
//           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Place Name :",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: Colors.grey)),
//               Text("${detailsSentResponse.placeName}",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//
//
//             ],
//
//           ),
//         ),
//
//         SizedBox(height: 1,),
//         Padding(
//           padding: const EdgeInsets.all(28.0),
//           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Place Location :",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: Colors.grey)),
//               Text("${detailsSentResponse.placeLocation}",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//
//
//             ],
//
//           ),
//         ),
//         SizedBox(height: 1,),
//         Padding(
//           padding: const EdgeInsets.all(28.0),
//           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Place Rating :",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: Colors.grey)),
//               Container(
//                 color: Colors.green,height: 20,width: 40,
//                 child: Center(
//                   child: Text("${detailsSentResponse.placeRating}",
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white)),
//                 ),
//               ),
//
//
//             ],
//
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//
//         SizedBox(height: 20,),
//
//         Expanded(
//           child: Container(
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount:detailsSentResponse.buddies!.length,
//           itemBuilder: (context, index) {
//           return DetailsSentCard(sentinvModel: detailsSentResponse.buddies![index],);
//           })),
//         ),
//
//       ],
//     ),
//   ),
// );
//   }
//
// }