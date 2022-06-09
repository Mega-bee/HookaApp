import 'package:flutter/material.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../../../../Helpers/colors.dart';
import 'edit_profile.dart';

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
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text("My Account",style: TextStyle(color: Primarycolor),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Primarycolor)),
          TextButton(onPressed: (){}, child:TextButton(
              onPressed:(){  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  EditProfile()),
              );},
              child: Text("Edit",style: TextStyle(color: Primarycolor),)),)

        ],
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),


          Row(
              children:[
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: MediaQuery.of(context).size.height*0.1,width:MediaQuery.of(context).size.width*0.20,

                    child:CircleAvatar(
                    backgroundColor:YellowColor,
                    child: Image.asset("assets/images/IMG_0095.JPG",)),
                    // Text("C",style: TextStyle(fontSize: 50,color: Colors.white),),)
                  )),
                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                    Text("Christian Zakhour",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("- Professional mobile developer . \n"
    "- Familiarity using version control tools like Git . \n"
                    "- Knowledge of Dart programming language . \n"
                  "- Experience in development of Android/iOS applications .",          )
    )),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Date of birth :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Gender :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Martial Status :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Height :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Weight :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Body Type :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),), SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Eyes :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Hair :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Education :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Profession :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Interests :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Padding(
            padding: const EdgeInsets.only(left: 22,right: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Hobbies :",style: TextStyle(fontStyle: FontStyle.italic),)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Container(height: 1,width: MediaQuery.of(context).size.width*0.9,color:Colors.grey,child:
          Card(color: Colors.black,elevation: 0),),


        ],
      ),
    );
  }
}
