import 'package:flutter/material.dart';
import 'package:hooka/di/di_config.dart';
import 'package:hooka/hooka_buddies/buddies_routes.dart';
import 'package:hooka/hooka_buddies/response/buddies_response.dart';
import 'package:hooka/hooka_buddies/ui/screens/invite.dart';
import '../../../abstracts/states/state.dart';
import '../screens/buddies.dart';
import '../widget/SearchWidgetBuddies.dart';
import '../widget/buddies_card.dart';

class BuddiesInitState extends States {
  final List<BuddiesResp> buddresp;
  final BuddiesState buddiesState;
  BuddiesInitState(
    this.buddiesState,
    this.buddresp,
  ) : super() {
    searchList = buddresp;
  }

  String query = '';
  List<BuddiesResp>? searchList;

  @override
  Widget getUI(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchWidgetBuddies(
          hintText: "Search",
          text: query,
          onChanged: (searchText) {
            searchText = searchText.toLowerCase();
            print(searchText);
            print("search test");
            searchList = buddresp
                .where(
                  (string) => (string.name!).toLowerCase().contains(
                searchText.toLowerCase(),
              ),
            )
                .toList();
            buddiesState.refresh();
          },
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Expanded(
        child: Card(
            child: ListView.builder(
                itemCount: searchList!.length,
                itemBuilder: (context1, index) {
                  final model = searchList![index];
                  return BuddiesCard(
                    inviteBody: () {
                      Navigator.pushNamed(context, BuddiesRoutes.InvitOp , arguments: model.id);
//                      showDialog(
//                        context: context,
//                        builder: (context) {
//                          return getIt<InviteBuddies>();
//                        },
//                      );
                    },
                    buddiesModel: model,
                  );
                })),
      )
    ]);
  }
}
