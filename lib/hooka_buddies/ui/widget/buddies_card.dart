import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooka/hooka_buddies/response/buddies_response.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../buddies_routes.dart';
import '../screens/view_profile.dart';

class BuddiesCard extends StatelessWidget {
  final BuddiesResp buddiesModel;
  final Function inviteBody;

  BuddiesCard({required this.buddiesModel,required this.inviteBody});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(children: [
          Stack(children: [
            Container(
                width: 80,
                height: 80,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Center(
                  child: Card(
                    elevation: 10,
                    shadowColor: YellowColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),

                    child: CachedNetworkImage(
                      imageUrl: buddiesModel.image.toString(),
                      height: 120,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballBeat,
                          colors: [Colors.black],
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    // CircleAvatar(
                    //   foregroundImage: AssetImage("${buddiesModel.image}"),
                    //   radius:120,
                    //   backgroundColor: Colors.red,
                    //
                    // ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 60, left: 20),
              child: Card(
                color: YellowColor,
                child: Center(
                    child: Text(
                  " ${buddiesModel.rating} ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
                elevation: 2,
                shadowColor: YellowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ]),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                ),
                buddiesModel.isAvailable == true
                    ? Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 12,
                      )
                    : Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 12,
                      ),
                SizedBox(
                  width: 5,
                ),
                buddiesModel.isAvailable == true
                    ? Text("Available",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                            fontWeight: FontWeight.bold))
                    : Text("Not Available",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 100),
              child: Text("${buddiesModel.name}",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                     inviteBody();
                   // Navigator.pushNamed(
                   //   context,
                   //   BuddiesRoutes.InvitOp,
                   // );
                  },
                  child: Container(
                    color: YellowColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Center(child: Text("invite")),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      BuddiesRoutes.PROFBUDDIES,arguments: buddiesModel.id.toString()
                    );
                  },
                  child: Container(
                    color: Primarycolor,
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Center(
                        child: Text(
                      "View Profile",
                      style: TextStyle(color: YellowColor),
                    )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ]),
        ]),
        Divider(color: Colors.grey, thickness: 0),
      ],
    );
  }
}
