import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
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
                      height: 90,
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
                    backgroundColor: Colors.red,
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
                child: const Text(
                  "About Me",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                        "Instagram          :   ${_profileResponse.socialMediaLink1}",
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
                  height: MediaQuery.of(context).size.height * 0.02,
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
                    borderRadius: BorderRadius.circular(25),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    baseColor: Colors.white,
                    expandedColor: Colors.white,
                    title: Text("Experiences :",
                        style: TextStyle(fontStyle: FontStyle.italic)),
                    // subtitle: Text('I expand!'),
                    children: <Widget>[
                      Container(

                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _profileResponse.experience!.length,
                          itemBuilder: (context1, index) {
                            final mod = _profileResponse.experience![index];
                            return
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(

                                  height: 380,width:double.infinity,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.black, width: 1),),
                                    child: Column(
                                      children: [

                                        Container(
                                          color:YellowColor,width: 500,
                                          height: 120,
                                          child:
                                          Icon(Icons.work,size: 90,),
                                        ),
                                        SizedBox(height: 20,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Place           :",style: TextStyle(fontSize: 20),),
                                              Text(mod.place.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),
                                        SizedBox(height: 15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Position        :",style: TextStyle(fontSize: 20),),
                                              Text(mod.position.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),SizedBox(height:15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(" From             :",style: TextStyle(fontSize: 20),),
                                              Text(mod.workedFrom.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),SizedBox(height: 15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text( " To                 :",style: TextStyle(fontSize: 20),),
                                              Text(mod.workedTo.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),

                                        SizedBox(height: 45,),




                                      ],
                                    ),
                                  ),
                                ),
                              );
                          },
                          shrinkWrap: true,

                        ),
                      ),
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
                    title: Text("Educations: ",
                        style: TextStyle(fontStyle: FontStyle.italic)),
                    // subtitle: Text('I expand!'),
                    children: <Widget>[
                      Container(

                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _profileResponse.education!.length,
                          itemBuilder: (context1, index) {
                            final mod = _profileResponse.education![index];
                            return
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(

                                  height: 380,width:double.infinity,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.black, width: 1),),
                                    child: Column(
                                      children: [

                                        Container(
                                          color:YellowColor,width: 500,
                                          height: 120,
                                          child:
                                          _profileResponse.genderId==1?
                                          Image.asset("assets/images/istockphoto-910022842-170667a-removebg-preview.png",
                                            fit: BoxFit.contain,
                                            height: 20,width: 20,):Image.asset("assets/images/fuser-Graduate-512.webp",
                                            fit: BoxFit.contain,
                                            height: 20,width: 20,),
                                        ),
                                        SizedBox(height: 20,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("University      :",style: TextStyle(fontSize: 20),),
                                              Text(mod.university.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),
                                        SizedBox(height: 15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Degree          :",style: TextStyle(fontSize: 20),),
                                              Text(mod.degree.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),SizedBox(height:15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("    From              :",style: TextStyle(fontSize: 20),),
                                              Text(mod.studiedFrom.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),SizedBox(height: 15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text( "    To                   :",style: TextStyle(fontSize: 20),),
                                              Text(mod.studiedTo.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),

                                        SizedBox(height: 45,),




                                      ],
                                    ),
                                  ),
                                ),
                              );
                          },
                          shrinkWrap: true,

                        ),
                      ),
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
                    title: Text("Addresses : ",
                        style: TextStyle(color: Colors.black)),
                    // subtitle: Text('I expand!'),
                    children: <Widget>[
                      Container(

                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _profileResponse.addresses!.length,
                          itemBuilder: (context1, index) {
                            final mod = _profileResponse.addresses![index];
                            return
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(

                                  height: 480,width:double.infinity,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.black, width: 1),),
                                    child: Column(
                                      children: [

                                        Container(
                                          color:YellowColor,width: 500,
                                          height: 120,
                                          child:
                                          Icon(Icons.location_city,size: 90,),
                                        ),
                                        SizedBox(height: 20,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Title               :",style: TextStyle(fontSize: 20),),
                                              Text(mod.title.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),
                                        SizedBox(height: 15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("City                  :",style: TextStyle(fontSize: 20),),
                                              Text(mod.city.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),SizedBox(height:15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(" Building             :",style: TextStyle(fontSize: 20),),
                                              Text(mod.building.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),SizedBox(height: 15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text( " Appartment            :",style: TextStyle(fontSize: 20),),
                                              Text(mod.appartment.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),SizedBox(height: 15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text( " Longitude:",style: TextStyle(fontSize: 20),),
                                              Text(mod.longitude.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),SizedBox(height: 15,),
                                        Container(
                                          color: Colors.grey[200],
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text( " Latitude:",style: TextStyle(fontSize: 20),),
                                              Text(mod.latitude.toString(),style: TextStyle(fontSize: 20),)
                                            ],),
                                        ),

                                        SizedBox(height: 45,),




                                      ],
                                    ),
                                  ),
                                ),
                              );
                          },
                          shrinkWrap: true,

                        ),
                      )
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
