import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool Selected=false;

  bool Selected1=false;
  bool Selected2=false;
  bool Selected3=false;
  @override
  Widget getUI(BuildContext context) {
    return Container(
      height: 900,
      decoration: BoxDecoration(

        gradient: LinearGradient(
          colors: [
            Colors.white,
            Color.fromRGBO(211,211,211, 0.9),
          ],
          begin:  FractionalOffset(0.0, 0.0),
          end:  FractionalOffset(0.0, 1.0),
          stops: [0.4, 1.0],
          tileMode: TileMode.repeated,

        ),
      ),
      child: Column(children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchWidgetBuddies(
              onFilterPress: (){},
              hintText: "Find Buddies...",
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
        ),

        Container(color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(width: 10,),
                FilterChip(
                  elevation: 1,
                  onSelected: (bool value){

                  },

                  label:Row(
                    children: [


                      Text("Experience",style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Icon(Icons.arrow_drop_down_outlined,size: 12,),
                    ],
                  ),
                  backgroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    side: BorderSide(color:Colors.black12 ),
                    borderRadius: BorderRadius.circular(5.0,),

                  ),),
                SizedBox(width: 10,),
                FilterChip(
                  elevation: 1,
                  onSelected: (bool value){

                  },

                  label:Row(
                    children: [


                      Text("Educations",style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Icon(Icons.arrow_drop_down_outlined,size: 12,),
                    ],
                  ),
                  backgroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    side: BorderSide(color:Colors.black12 ),
                    borderRadius: BorderRadius.circular(5.0,),

                  ),),
                SizedBox(width: 10,),
                FilterChip(
                  elevation: 1,
                  onSelected: (bool value){

                  },

                  label:Row(
                    children: [


                      Text("Address",style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Icon(Icons.arrow_drop_down_outlined,size: 12,),
                    ],
                  ),
                  backgroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    side: BorderSide(color:Colors.black12 ),
                    borderRadius: BorderRadius.circular(5.0,),

                  ),),
                SizedBox(width: 10,),
                FilterChip(
                  elevation: 1,
                  onSelected: (bool value){
                    Selected2=!Selected2;
                    buddiesState.refresh();
                  },

                  label:Row(
                    children: [

                      Selected2==true?Row(
                        children: [
                          Icon(Icons.check,size: 10,), SizedBox(width: 3,),
                        ],
                      ):Container(),

                      Text("Nearest",style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),

                    ],
                  ),
                  backgroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    side: BorderSide(color:Colors.black12 ),
                    borderRadius: BorderRadius.circular(5.0,),

                  ),),
                SizedBox(width: 10,),
                FilterChip(
                  elevation: 1,
                  onSelected: (bool value){
                    Selected3=!Selected3;
                    buddiesState.refresh();
                  },

                  label:Row(
                    children: [

                      Selected3==true?Row(
                        children: [
                          Icon(Icons.check,size: 10,), SizedBox(width: 3,),
                        ],
                      ):Container(),

                      Text("Hair",style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600)),

                    ],
                  ),
                  backgroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    side: BorderSide(color:Colors.black12 ),
                    borderRadius: BorderRadius.circular(5.0,),

                  ),),
                SizedBox(width: 10,),
                FilterChip(
                  elevation: 1,
                  onSelected: (bool value){
                    Selected1=!Selected1;
                    buddiesState.refresh();
                  },

                  label:Row(
                    children: [

                      Selected1==true?Row(
                        children: [
                          Icon(Icons.check,size: 10,), SizedBox(width: 3,),
                        ],
                      ):Container(),

                      Text("Rating",style: GoogleFonts.anekLatin(fontWeight: FontWeight.w600),),

                    ],
                  ),
                  backgroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    side: BorderSide(color:Colors.black12 ),
                    borderRadius: BorderRadius.circular(5.0,),

                  ),),


              ],
            ),
          ),
        ),
        Expanded(

          child:
          GridView.builder(

              shrinkWrap: true,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (4/4),

                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: searchList!.length,
              itemBuilder: (context1, index) {
                final model = searchList![index];
                return BuddiesCard( inviteBody: () {
      Navigator.pushNamed(context, BuddiesRoutes.InvitOp , arguments: model.id);},
                  buddiesModel: model,
                );


              }
              ),
//         ListView.builder(
//             itemCount: searchList!.length,
//             itemBuilder: (context1, index) {
//               final model = searchList![index];
//               return BuddiesCard(
//                 inviteBody: () {
//                   Navigator.pushNamed(context, BuddiesRoutes.InvitOp , arguments: model.id);
// //                      showDialog(
// //                        context: context,
// //                        builder: (context) {
// //                          return getIt<InviteBuddies>();
// //                        },
// //                      );
//                 },
//                 buddiesModel: model,
//               );
//             }),
        )
      ]),
    );
  }
}
