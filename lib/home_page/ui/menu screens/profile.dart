import 'package:flutter/material.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../../../Helpers/colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text("My Account",style: TextStyle(color: Primarycolor),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Primarycolor)),
          TextButton(onPressed: (){}, child: Text("Edit",style: TextStyle(color: Primarycolor),)),

        ],
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children:[
                SizedBox(width: MediaQuery.of(context).size.width*0.5,),
                Text("Available",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                Container(height: 35,width: 60,
                  child: RollingSwitch.icon(
                    innerSize: 40,
                    height: 60,
                    width: 60,
                    circularColor: Colors.white,
                    onChanged: (bool state) {
                      print('turned ${(state) ? 'on' : 'off'}');
                    },
                    rollingInfoRight:  RollingIconInfo(



                      backgroundColor: YellowColor,


                    ),
                    rollingInfoLeft:  RollingIconInfo(

                      icon: Icons.close,

                      backgroundColor: Colors.grey,

                    ),

                  ),
                ),

              ]),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Container(
              height: 120,width:120,
              child:CircleAvatar(
                backgroundColor: Colors.blue[900],
                child: Text("C",style: TextStyle(fontSize: 70,color: Colors.white),),
              ))
        ],
      ),
    );
  }
}
