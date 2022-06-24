import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/colors.dart';
import 'about.dart';

import 'package:rolling_switch/rolling_switch.dart';

import '../../utils/effect/custom_page_route.dart';
import '../../home_page/ui/widget/menu_widget.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value =false;
  bool value1 =false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("Settings",style: TextStyle(color: Colors.black),),

      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Align(alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("   Preferences",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                Icon(Icons.notifications,color: value==false?
                Colors.grey:YellowColor),
                SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                Text("Notifications ",style: TextStyle(fontSize: 17),),
                SizedBox(width: MediaQuery.of(context).size.width*0.40,),

                Container(height: 29,width: 55,
                    child: Transform.scale(
                      scale: 0.9,
                      child: Switch.adaptive(
                          activeColor: YellowColor,
                          inactiveTrackColor: Colors.grey,
                          value: value,
                          onChanged: (value) {
                            this.value = value;

                            setState(
                                  () {},
                            );
                          }),
                    )
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.01,),


              ],),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                Icon(Icons.settings,
                  color: value1==false?
                  Colors.grey:YellowColor),
                SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                Text("Available     ",style: TextStyle(fontSize: 17),),
                SizedBox(width: MediaQuery.of(context).size.width*0.42,),

                Container(height: 29,width: 55,
                    child: Transform.scale(
                      scale: 0.9,
                      child: Switch.adaptive(
                          activeColor: YellowColor,
                          inactiveTrackColor: Colors.grey,
                          value: value1,
                          onChanged: (value) {
                            this.value1 = value;

                            setState(
                                  () {},
                            );
                          }),
                    )
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.01,),


              ],),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            Align(alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("   Support",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
    GestureDetector(
        onTap: (){Navigator.push(
            context,
            CustomPageRoute(child:About()));},
        child: Row(children: [
        SizedBox(width: MediaQuery.of(context).size.width*0.05,),

        Icon(Icons.info,color: Colors.grey,),
        SizedBox(width: MediaQuery.of(context).size.width*0.05,),
        Text("About",style: TextStyle(fontSize: 17),),]),
    ),     SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Row(children: [
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),

              Icon(Icons.star,color: Colors.grey,),
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),
              Text("Rate Us",style: TextStyle(fontSize: 17),),]),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Row(children: [
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),

              Icon(Icons.privacy_tip,color: Colors.grey,),
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),
              Text("Legal",style: TextStyle(fontSize: 17),),]),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Row(children: [
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),

              Icon(Icons.flag,color: Colors.grey,),
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),
              InkWell(
                  onTap: (){},
                  child: Text("Report an abuse",style: TextStyle(fontSize: 17),)),]),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            Align(alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("   Share",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            Row(

              children:[
                SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:50,width: 50,
                  child: Card(
                    color: Colors.grey[400],
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),),
                    child: Center(child: Icon(FontAwesomeIcons.facebookF,size: 25,color: Colors.white,)),


                  ),
                ),
              ),
                // SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height:50,width: 50,
                    child: Card(
                      color: Colors.grey[400],
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),),
                      child: Center(child: Icon(FontAwesomeIcons.linkedin,size: 25,color: Colors.white,)),


                    ),
                  ),
                ),
                // SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height:50,width: 50,
                    child: Card(
                      color: Colors.grey[400],
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),),
                      child: Center(child: Icon(FontAwesomeIcons.twitter,size: 25,color: Colors.white,)),


                    ),
                  ),
                ),
            ]),
            SizedBox(height: MediaQuery.of(context).size.height*0.3,),
          ],
        ),
      ),
    );
  }
}
