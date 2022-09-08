import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../abstracts/states/state.dart';
import '../../response/profile_response.dart';
import '../screens/profile.dart';

class ProfileInitState extends States {
  final ProfileResponse _profileResponse;
  final ProfileState screenState;

  ProfileInitState(this._profileResponse, this.screenState);
  final name = TextEditingController();

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
          Row(children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.20,

                  child: CircleAvatar(
                    child: CachedNetworkImage(
                      imageUrl: _profileResponse.imageUrl.toString(),
                      height: 80,
                      width: 80,
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
                      placeholder: (context, url) => const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballBeat,
                          colors: [Colors.black],
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    radius: 120,
                    backgroundColor: Colors.white,
                  ),
                  // Text("C",style: TextStyle(fontSize: 50,color: Colors.white),),)
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Text(
              _profileResponse.name.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                     Text(
                      "About Me",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                     Text(_profileResponse.aboutMe.toString(),

                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            height: 2,
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.grey,
            child: Card(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone Number  :   ${_profileResponse.phoneNumber}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email                  :   ${_profileResponse.email}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Instagram          :   ${_profileResponse.socialMediaLink2}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "facebook           :   ${_profileResponse.socialMediaLink1}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "twitter               :   ${_profileResponse.socialMediaLink3}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date of birth     :   ${_profileResponse.birthDate!.split("T").first}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender             :   ${_profileResponse.gender}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Martial Status  :   ${_profileResponse.maritalStatus}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Height              :   ${_profileResponse.height} cm",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Weight             :   ${_profileResponse.weight} kg",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Body Type       :   ${_profileResponse.bodyType}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Eyes                :   ${_profileResponse.eyes}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hobbies          :   ${_profileResponse.hobbies}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Interest           :   ${_profileResponse.interests}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hair                 :   ${_profileResponse.hair}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey,
                  child: Card(color: Colors.black, elevation: 0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  color: Colors.white,
                  child: ExpansionTileCard(
                    baseColor: Colors.white,
                    expandedColor: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    title: Text("Experiences",
                        style: TextStyle(color: Colors.black)),
                    // subtitle: Text('I expand!'),
                    children: <Widget>[
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _profileResponse.experience!.length,
                          itemBuilder: (context1, index) {
                            final m = _profileResponse.experience![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 1.0,
                                vertical: 2.0,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                    child: Container(
                                      height: 180,
                                      child: Center(
                                        child: Card(
                                            elevation: 2,

                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                                side: BorderSide(
                                                  width: 0,
                                                  color: Colors.black26,)
                                            ),
                                            child:
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    ListTile(

                                                      title:  Column(
                                                        children: [
                                                          Row(mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text("Experiences ${index+1} ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500 ),),
                                                              SizedBox(width: 5,),
                                                              Icon(Icons.work,size: 12,)
                                                            ],
                                                          ),
                                                          Divider(height: 20,color: Colors.black26,),
                                                          SizedBox(height: 5,),
                                                        ],
                                                      ),

                                                      subtitle: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width:0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("Place : ${m.place}"

                                                                        ,style: TextStyle(
                                                                            fontSize: 11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),  Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width: 0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("Position : ${m.position}"

                                                                        ,style: TextStyle(
                                                                            fontSize: 11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width: 0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("From : ${m.workedFrom}"

                                                                        ,style: TextStyle(
                                                                            fontSize: 11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),  Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width: 0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("To : ${m.workedTo}"

                                                                        ,style: TextStyle(
                                                                            fontSize:11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    // Row(
                                                    //   children: [
                                                    //     Container(child: Card(child: Icon(Icons.check,color: Colors.yellow,)),),
                                                    //     Column(
                                                    //       children: [
                                                    //         Text("Design Native Task Management ",style: TextStyle(color: Colors.black),),
                                                    //         Text("(New feature in Workiom) Similar ",style: TextStyle(color: Colors.black),),
                                                    //         Text("to Asana, Clickup                         ",style: TextStyle(color: Colors.black),),
                                                    //       ],
                                                    //     ),
                                                    //   ],
                                                    // ),



                                                  ],
                                                ),
                                              ),
                                            )
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
                Divider(color: Colors.black, endIndent: 20, indent: 20),
                Container(
                  color: Colors.white,
                  child: ExpansionTileCard(
                    baseColor: Colors.white,
                    expandedColor: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    title: Text("Educations",
                        style: TextStyle(color: Colors.black)),
                    // subtitle: Text('I expand!'),
                    children: <Widget>[
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _profileResponse.education!.length,
                          itemBuilder: (context1, index) {
                            final m = _profileResponse.education![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 1.0,
                                vertical: 2.0,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                    child: Container(
                                      height: 180,
                                      child: Center(
                                        child: Card(
                                            elevation: 2,

                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                                side: BorderSide(
                                                  width: 0,
                                                  color: Colors.black26,)
                                            ),
                                            child:
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    ListTile(

                                                      title:  Column(
                                                        children: [
                                                          Row(mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text("Education ${index+1}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500 ),),
                                                              SizedBox(width: 5,),
                                                              Icon(Icons.school,size: 12,)
                                                            ],
                                                          ),
                                                          Divider(height: 20,color: Colors.black26,),
                                                          SizedBox(height: 5,),
                                                        ],
                                                      ),

                                                      subtitle: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width:0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("University : ${m.university}"

                                                                        ,style: TextStyle(
                                                                            fontSize: 11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),  Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width: 0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("Degree : ${m.degree}"

                                                                        ,style: TextStyle(
                                                                            fontSize: 11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width: 0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("From : ${m.studiedFrom}"

                                                                        ,style: TextStyle(
                                                                            fontSize: 11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),  Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width: 0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("To : ${m.studiedTo}"

                                                                        ,style: TextStyle(
                                                                            fontSize:11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    // Row(
                                                    //   children: [
                                                    //     Container(child: Card(child: Icon(Icons.check,color: Colors.yellow,)),),
                                                    //     Column(
                                                    //       children: [
                                                    //         Text("Design Native Task Management ",style: TextStyle(color: Colors.black),),
                                                    //         Text("(New feature in Workiom) Similar ",style: TextStyle(color: Colors.black),),
                                                    //         Text("to Asana, Clickup                         ",style: TextStyle(color: Colors.black),),
                                                    //       ],
                                                    //     ),
                                                    //   ],
                                                    // ),



                                                  ],
                                                ),
                                              ),
                                            )
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
                Divider(color: Colors.black, endIndent: 20, indent: 20),
                Container(
                  color: Colors.white,
                  child: ExpansionTileCard(
                    baseColor: Colors.white,
                    expandedColor: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    title: Text("Addresses",
                        style: TextStyle(color: Colors.black)),
                    // subtitle: Text('I expand!'),
                    children: <Widget>[
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _profileResponse.addresses!.length,
                          itemBuilder: (context1, index) {
                            final m = _profileResponse.addresses![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 1.0,
                                vertical: 2.0,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                    child: Container(
                                      height: 180,
                                      child: Center(
                                        child: Card(
                                            elevation: 2,

                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                                side: BorderSide(
                                                  width: 0,
                                                  color: Colors.black26,)
                                            ),
                                            child:
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    ListTile(

                                                      title:  Column(
                                                        children: [
                                                          Row(mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text("Address ${index+1}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500 ),),
                                                              SizedBox(width: 5,),
                                                              Icon(Icons.location_on_outlined,size: 12,)
                                                            ],
                                                          ),
                                                          Divider(height: 20,color: Colors.black26,),
                                                          SizedBox(height: 5,),
                                                        ],
                                                      ),

                                                      subtitle: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width:0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("Name : ${m.title}"

                                                                        ,style: TextStyle(
                                                                            fontSize: 11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),  Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width: 0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("City : ${m.city}"

                                                                        ,style: TextStyle(
                                                                            fontSize: 11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width: 0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("Building : ${m.building}"

                                                                        ,style: TextStyle(
                                                                            fontSize: 11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),  Container(
                                                                  height:30,width: 130,
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      side: BorderSide(
                                                                        width: 0,
                                                                        color: Colors.black26,),),
                                                                    child: Center(
                                                                      child: Text("Street : ${m.street}"

                                                                        ,style: TextStyle(
                                                                            fontSize:11,fontWeight: FontWeight.w500
                                                                        ),),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    // Row(
                                                    //   children: [
                                                    //     Container(child: Card(child: Icon(Icons.check,color: Colors.yellow,)),),
                                                    //     Column(
                                                    //       children: [
                                                    //         Text("Design Native Task Management ",style: TextStyle(color: Colors.black),),
                                                    //         Text("(New feature in Workiom) Similar ",style: TextStyle(color: Colors.black),),
                                                    //         Text("to Asana, Clickup                         ",style: TextStyle(color: Colors.black),),
                                                    //       ],
                                                    //     ),
                                                    //   ],
                                                    // ),



                                                  ],
                                                ),
                                              ),
                                            )
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
                Divider(color: Colors.black, endIndent: 20, indent: 20),
                SizedBox(
                  height: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
