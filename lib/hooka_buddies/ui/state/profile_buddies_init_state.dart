import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../abstracts/states/state.dart';
import '../../response/profile_buddies_response.dart';
import '../screens/view_profile.dart';


class ProfileBuddiesInitState extends States {
  final BuddiesProfResponse _profileResponse;
  final ViewProfileBuddieState screenState;
  ProfileBuddiesInitState(this._profileResponse,this.screenState);
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  @override
  Widget getUI(BuildContext context) {

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),


          Row(
              children:[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.12,width:MediaQuery.of(context).size.width*0.20,

                      child: CircleAvatar(

                        child:    CachedNetworkImage(
                          imageUrl:_profileResponse.imageUrl.toString(),height: 90,fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>const Padding(
                            padding:  EdgeInsets.all(15.0),
                            child: LoadingIndicator(

                              indicatorType:
                              Indicator.ballBeat,


                              colors: [Colors.black],
                            ),),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),

                        radius:120,
                        backgroundColor: Colors.red,
                      ),
                      // Text("C",style: TextStyle(fontSize: 50,color: Colors.white),),)
                    )),
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                Text(_profileResponse.name.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ]),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),

            child: Align(
                alignment: Alignment.centerLeft,
                child: const Text("About Me",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 2,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child: Card(color: Colors.black,),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Container(
            height: 1000,
            child:
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Phone Number  :   ${_profileResponse.phoneNumber}",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),





                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email                  :   ${_profileResponse.email}",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),





                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Instagram          :   ${_profileResponse.socialMediaLink1}",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),





                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Date of birth     :   ${_profileResponse.birthDate!.split("T").first}",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Gender             :   ${_profileResponse.gender}",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Martial Status  :   ${_profileResponse.maritalStatus}",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Height              :   ${_profileResponse.height} cm",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Weight             :   ${_profileResponse.weight} kg",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Body Type       :   ${_profileResponse.bodyType}",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),), SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Eyes                :   ${_profileResponse.eyes}",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Hair                 :   ${_profileResponse.hair}",style: TextStyle(fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),





                  Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
                  Card(color: Colors.black,elevation: 0),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                  Container(
                    height: 140,
                    child:
                    Container(
                      color: Colors.white,
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ExpansionTileCard(
                          baseColor: Colors.white,
                          expandedColor: Colors.white,

                          key: cardA,
                          leading: Icon(Icons.work,color: Colors.grey,),
                          title: Text("Experiences",style: TextStyle(color: Colors.black)),
                          // subtitle: Text('I expand!'),
                          children: <Widget>[
                            Divider(
                              thickness: 1.0,
                              height: 1.0,

                            ),
                            Container(height: 70,
                              child: ListView.builder(

                                  itemCount: _profileResponse.experience!.length,
                                  itemBuilder: (context1, index) {
                                    final model = _profileResponse.experience![index];
                                    return
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 1.0,
                                          vertical: 2.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 200),
                                              child:
                                              RichText(
                                                text: TextSpan(
                                                    text: "Place        : ",
                                                    children: [
                                                      TextSpan(
                                                          text: "${model.place}",
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12)),
                                                    ],
                                                    style:
                                                    const TextStyle(color: Colors.black54, fontSize: 15)),
                                                textAlign: TextAlign.center,
                                              ),

                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 190),
                                              child:
                                              RichText(
                                                text: TextSpan(
                                                    text: "Position    : ",
                                                    children: [
                                                      TextSpan(
                                                          text: "${model.position}",
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12)),
                                                    ],
                                                    style:
                                                    const TextStyle(color: Colors.black54, fontSize: 15)),
                                                textAlign: TextAlign.center,
                                              ),


                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 160),
                                              child:
                                              RichText(
                                                text: TextSpan(
                                                    text: "WorkedFrom :  ",
                                                    children: [
                                                      TextSpan(
                                                          text: "${model.workedFrom}",
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12)),
                                                    ],
                                                    style:
                                                    const TextStyle(color: Colors.black54, fontSize: 15)),
                                                textAlign: TextAlign.center,
                                              ),


                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 160),
                                              child:
                                              RichText(
                                                text: TextSpan(
                                                    text: "WorkedTo     :  ",
                                                    children: [
                                                      TextSpan(
                                                          text: "${model.workedTo}",
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12)),
                                                    ],
                                                    style:
                                                    const TextStyle(color: Colors.black54, fontSize: 15)),
                                                textAlign: TextAlign.center,
                                              ),


                                            ),



                                          ],
                                        ),
                                      );}),
                            )

                          ],
                        ),
                      ),


                    ),
                  ),
                  Divider(color: Colors.black,endIndent: 20,indent: 20),
                  Container(
                    height: 140,
                    child:
                    Container(
                      color: Colors.white,
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ExpansionTileCard(
                          baseColor: Colors.white,
                          expandedColor: Colors.white,

                          key: cardB,
                          leading: Icon(Icons.grade,color: Colors.grey,),

                          title: Text("Educations",style: TextStyle(color: Colors.black)),
                          // subtitle: Text('I expand!'),
                          children: <Widget>[
                            Divider(
                              thickness: 1.0,
                              height: 1.0,

                            ),
                            Container(height: 70,
                              child: ListView.builder(

                                  itemCount: _profileResponse.education!.length,
                                  itemBuilder: (context1, index) {
                                    final m = _profileResponse.education![index];
                                    return
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 1.0,
                                          vertical: 2.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 200),
                                              child:
                                              RichText(
                                                text: TextSpan(
                                                    text: "University        : ",
                                                    children: [
                                                      TextSpan(
                                                          text: "${m.university}",
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12)),
                                                    ],
                                                    style:
                                                    const TextStyle(color: Colors.black54, fontSize: 15)),
                                                textAlign: TextAlign.center,
                                              ),

                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 190),
                                              child:
                                              RichText(
                                                text: TextSpan(
                                                    text: "Degree    : ",
                                                    children: [
                                                      TextSpan(
                                                          text: "${m.degree}",
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12)),
                                                    ],
                                                    style:
                                                    const TextStyle(color: Colors.black54, fontSize: 15)),
                                                textAlign: TextAlign.center,
                                              ),


                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 160),
                                              child:
                                              RichText(
                                                text: TextSpan(
                                                    text: "StudiedFrom :  ",
                                                    children: [
                                                      TextSpan(
                                                          text: "${m.studiedFrom}",
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12)),
                                                    ],
                                                    style:
                                                    const TextStyle(color: Colors.black54, fontSize: 15)),
                                                textAlign: TextAlign.center,
                                              ),


                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 160),
                                              child:
                                              RichText(
                                                text: TextSpan(
                                                    text: "StudiedTo     :  ",
                                                    children: [
                                                      TextSpan(
                                                          text: "${m.studiedTo}",
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12)),
                                                    ],
                                                    style:
                                                    const TextStyle(color: Colors.black54, fontSize: 15)),
                                                textAlign: TextAlign.center,
                                              ),


                                            ),



                                          ],
                                        ),
                                      );}),
                            )

                          ],
                        ),
                      ),


                    ),
                  ),
                  Divider(color: Colors.black,endIndent: 20,indent: 20),
                  Container(
                    height: 140,
                    child:
                    Container(
                      color: Colors.white,
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ExpansionTileCard(
                          baseColor: Colors.white,
                          expandedColor: Colors.white,

                          key: cardC,
                          leading: Icon(Icons.location_city,color: Colors.grey,),

                          title: Text("Addresses",style: TextStyle(color: Colors.black)),
                          // subtitle: Text('I expand!'),
                          children: <Widget>[
                            Divider(
                              thickness: 1.0,
                              height: 1.0,

                            ),
                            Container(height: 70,
                              child: ListView.builder(

                                  itemCount: _profileResponse.addresses!.length,
                                  itemBuilder: (context1, index) {
                                    final model = _profileResponse.addresses![index];
                                    return
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 1.0,
                                          vertical: 2.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 200),
                                              child:
                                              RichText(
                                                text: TextSpan(
                                                    text: "Place        : ",
                                                    children: [
                                                      TextSpan(
                                                          text: "${model.title}",
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12)),
                                                    ],
                                                    style:
                                                    const TextStyle(color: Colors.black54, fontSize: 15)),
                                                textAlign: TextAlign.center,
                                              ),

                                            ),









                                          ],
                                        ),
                                      );}),
                            )

                          ],
                        ),
                      ),


                    ),
                  ),
                  Divider(color: Colors.black,endIndent: 20,indent: 20),
                  SizedBox(height: 1,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}