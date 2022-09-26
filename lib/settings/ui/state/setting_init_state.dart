

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../response/setting_response.dart';
import '../about.dart';
import '../screen/settings.dart';

class SettingInitState extends States {
  final SettingsState screenState;
  final SettingResponse settingResponse;
  SettingInitState(this.settingResponse,this.screenState);

  bool value =false;
  bool value1 =false;
  @override

  Widget getUI(BuildContext context) {
   bool value2=settingResponse.isAvailable!;
   return     SingleChildScrollView(
     child: Column(
       children: [
         SizedBox(height: MediaQuery.of(context).size.height*0.02,),
         Align(alignment: Alignment.centerLeft,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("   Preferences",
               style: GoogleFonts.alef(fontSize: 22,fontWeight: FontWeight.bold),
             ),
           ),
         ),
         SizedBox(height: MediaQuery.of(context).size.height*0.04,),



         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [

             SizedBox(width: MediaQuery.of(context).size.width*0.05,),
             Icon(Icons.settings,

                 color: value2==false?
                 Colors.grey:YellowColor),
             SizedBox(width: MediaQuery.of(context).size.width*0.03,),

             Text("Available     ",style: GoogleFonts.anekLatin(fontSize: 17,fontWeight: FontWeight.w500),),
             SizedBox(width: MediaQuery.of(context).size.width*0.42,),

             Container(height: 29,width: 55,
                 child: Transform.scale(
                   scale: 0.9,
                   child: Switch.adaptive(
                       activeColor: YellowColor,
                       inactiveTrackColor: Colors.grey,
                       value: value2,
                       onChanged: (value) {
                         settingResponse.isAvailable = value;
                         screenState.Availableeee();
                         value2==false?
                         Fluttertoast.showToast(msg: "Available"):
                         Fluttertoast.showToast(msg: "Not Available");


                         screenState.refresh();

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
               style: GoogleFonts.alef(fontSize: 22,fontWeight: FontWeight.bold),
             ),
           ),
         ),
         SizedBox(height: MediaQuery.of(context).size.height*0.05,),
         GestureDetector(
           onTap: (){
             Navigator.push(
               context,
               CustomPageRoute(child:About()));},
           child: Row(children: [
             SizedBox(width: MediaQuery.of(context).size.width*0.05,),

             Icon(Icons.info,color: Colors.grey,),
             SizedBox(width: MediaQuery.of(context).size.width*0.05,),
             Text("About",style: GoogleFonts.anekLatin(fontSize: 17,fontWeight: FontWeight.w500),),]),
         ),     SizedBox(height: MediaQuery.of(context).size.height*0.03,),
         Row(children: [
           SizedBox(width: MediaQuery.of(context).size.width*0.05,),

           Icon(Icons.star,color: Colors.grey,),
           SizedBox(width: MediaQuery.of(context).size.width*0.05,),
           Text("Rate Us",style: GoogleFonts.anekLatin(fontSize: 17,fontWeight: FontWeight.w500),),]),
         SizedBox(height: MediaQuery.of(context).size.height*0.03,),
         Row(children: [
           SizedBox(width: MediaQuery.of(context).size.width*0.05,),

           Icon(Icons.privacy_tip,color: Colors.grey,),
           SizedBox(width: MediaQuery.of(context).size.width*0.05,),
           Text("Legal",style: GoogleFonts.anekLatin(fontSize: 17,fontWeight: FontWeight.w500),),]),


         SizedBox(height: MediaQuery.of(context).size.height*0.04,),
         Align(alignment: Alignment.centerLeft,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("   Share",
               style: GoogleFonts.alef(fontSize: 22,fontWeight: FontWeight.bold),
             ),
           ),
         ),
         SizedBox(height: MediaQuery.of(context).size.height*0.04,),
         Row(

             children:[
               SizedBox(width: MediaQuery.of(context).size.width*0.04,),
               InkWell(
                 onTap: () async {
    final url =
    '${settingResponse.socialMediaLinks!.socialMediaLink1}';
    if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
    };},
                 child: Padding(
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
               ),
               // SizedBox(width: MediaQuery.of(context).size.width*0.01,),
               InkWell(
                 onTap: () async {
    final url =
    '${settingResponse.socialMediaLinks!.socialMediaLink2}';
    if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
    };},
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height:50,width: 50,
                     child: Card(
                       color: Colors.grey[400],
                       elevation: 2,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),),
                       child: Center(child: Icon(FontAwesomeIcons.instagram,size: 25,color: Colors.white,)),


                     ),
                   ),
                 ),
               ),
               // SizedBox(width: MediaQuery.of(context).size.width*0.01,),
               InkWell(
                 onTap: () async {
    final url =
    '${settingResponse.socialMediaLinks!.socialMediaLink3}';
    if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
    };},
                 child: Padding(
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
               ),
             ]),
         SizedBox(height: MediaQuery.of(context).size.height*0.3,),
       ],
     ),
   );
  }

}