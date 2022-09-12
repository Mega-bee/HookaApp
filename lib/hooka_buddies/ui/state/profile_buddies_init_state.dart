import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../abstracts/states/state.dart';
import '../../buddies_routes.dart';
import '../../response/profile_buddies_response.dart';
import '../screens/view_profile.dart';

class ProfileBuddiesInitState extends States {
  final BuddiesProfResponse _profileResponse;
  final ViewProfileBuddieState screenState;

  ProfileBuddiesInitState(this._profileResponse, this.screenState);

  @override
  Widget getUI(BuildContext context) {
    return
      SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: 400,
                child: Stack(children: [
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 1,

                      child:
                      CachedNetworkImage(
                        imageUrl: _profileResponse.imageUrl.toString(),
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
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
                      // Text("C",style: TextStyle(fontSize: 50,color: Colors.white),),)
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 8,
            ),
            child: Row(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(
                _profileResponse.name.toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                height: 32,
                color: Color.fromRGBO(250, 216, 1, 0.4),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BuddiesRoutes.InvitOp,
                        arguments: _profileResponse.id);
                  },
                  child: Text(
                    "invite",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
              right: 20,
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${_profileResponse.email}",
                  style: TextStyle(fontSize: 15),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 20, top: 8),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${_profileResponse.phoneNumber}",
                  style: TextStyle(fontSize: 15),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "About",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _profileResponse.aboutMe.toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 20, top: 8),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Basic Information",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      color: Colors.white,
                      child: Table(
                        border: TableBorder.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'Date Of Birth',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      _profileResponse.birthDate
                                          .toString()
                                          .split("T")
                                          .first ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'Gender',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      _profileResponse.gender
                                          ?? ""
                                        ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'Status',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      _profileResponse.maritalStatus
                                          ?? ""
                                         ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'Height',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      _profileResponse.height!.toString()

                                          ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child:
                                    Text(
                                      'Weight',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child:

                                    Text(
                                      _profileResponse.weight!.toString()
                                          ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'Body Type',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      _profileResponse.bodyType  ?? ""
                                         ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'Hair',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child:

                                    Text(
                                      _profileResponse.hair.toString()

                                     ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'Eyes',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      _profileResponse.eyes
                                          ?? "Empty"
                                          ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.facebook,
                    size: 20,
                  ),
                  onPressed: () async {
                    final url = '${_profileResponse.socialMediaLink1}';
                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false);
                    }
                    ;
                  },
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    size: 20,
                  ),
                  onPressed: () async {
                    final url = '${_profileResponse.socialMediaLink2}';
                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false);
                    }
                    ;
                  },
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.twitter,
                    size: 20,
                  ),
                  onPressed: () async {
                    final url = '${_profileResponse.socialMediaLink3}';
                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false);
                    }
                    ;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 20, top: 8),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Interest",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      children: [

                        _profileResponse.interests!.isEmpty?
                        Container(
                          width: 120,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(20,100, 180, 0.3),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child:
                              Text("No Interest yet..",style: TextStyle(color: Colors.black),)),
                        ):
                        Container(
                          width: 80,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(20,100, 180, 0.3),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child:
                                  Text(_profileResponse.interests.toString(),style: TextStyle(color: Colors.black),)),
                        )
                      ],
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            color: Colors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              Padding(
                padding: const EdgeInsets.only(left: 22, right: 20,),
                child: Text("Experiences",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
                  _profileResponse.experience==null || _profileResponse.experience!.isEmpty ?Column(
                    children: [
SizedBox(height:
  10,),
                      Align(

                        alignment : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25,),
                          child: Text("No Experiences..",style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                          ),)),
                      SizedBox(height: 10,),

                    ],
                  ):
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Container(
                  height: 220,
                  child:

                  GridView.builder(
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: (2.8/4),

                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,

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
                                child:
                                Container(
                                  height: 180,width: 300,
                                  child:  Container(
                                    color: Colors.white,
                                    child: Table(
                                      border: TableBorder.all(
                                        color: Colors.black12,
                                        width: 1,
                                      ),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    'Place',
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text(

                                                        m.place.toString(),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    'From',
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    m.workedFrom.toString(),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),

                                        ]),
                                        TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    'Position',
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    m.position.toString(),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    'To',
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    m.workedTo.toString(),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),

                                        ]),

                                      ],
                                    ),
                                  ),


                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),

            ]),
          ),
          _profileResponse.education!.isEmpty?SizedBox(height: 20,):Container(),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Container(
              color: Colors.white,
              child:  _profileResponse.experience==null || _profileResponse.experience!.isEmpty ?Align(

                alignment : Alignment.centerLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 26,),
                      child: Text("Educations",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ),SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,),
                      child: Text("No Educations..",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                      ),)

                  ],
                ),
              ):

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 1, ),
                      child: Text("Educations",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ),
                    Container(
                      height: 220,
                      child:
                      _profileResponse.education==null || _profileResponse.education!.isEmpty ?Text("No Experiences yet.."):
                      GridView.builder(

                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: (2.5/4),

                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,

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
                                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                      child:
                                      Container(
                                        height: 180,width: 300,
                                        child:  Container(
                                          color: Colors.white,
                                          child: Table(
                                            border: TableBorder.all(
                                              color: Colors.black12,
                                              width: 1,
                                            ),
                                            children: [
                                              TableRow(children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Text(
                                                          'University',
                                                          style: TextStyle(fontSize: 12),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Text(

                                                          m.university.toString(),
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Text(
                                                          'From',
                                                          style: TextStyle(fontSize: 12),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Text(
                                                          m.studiedFrom.toString(),
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                              ]),
                                              TableRow(children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Text(
                                                          'Degree',
                                                          style: TextStyle(fontSize: 12),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Text(
                                                          m.degree.toString(),
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Text(
                                                          'To',
                                                          style: TextStyle(fontSize: 12),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Text(
                                                          m.studiedTo.toString(),
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),

                                              ]),

                                            ],
                                          ),
                                        ),


                                      ),
                                    ),
                                  ],
                                ),
                              );
                          }),
                    ),

                  ]),
            ),
          ),
          _profileResponse.education!.isEmpty ?
          SizedBox(
            height: 80,
          ):
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}
