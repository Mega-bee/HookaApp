import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Helpers/colors.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},

        ),
        title: Text("King of Grill",style: TextStyle(color: Primarycolor),),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on,color: Primarycolor,size: 30,),
            onPressed: (){},

          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              height: MediaQuery.of(context).size.height*0.4,
           child: Center(child: Image.asset("assets/images/hooka logo.png",fit: BoxFit.cover,
           height: 600,
           )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Text("King of Grill", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                Container(

    height: 30,
    width: 60,
    color: Colors.transparent,
                  child: Card(
                      color: Colors.green
                      ,
                      child: Center(child: Text("2.78",
    style: TextStyle(fontSize: 12,color: Colors.white)))),
                ),

            ],),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 75,right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Bcharry",
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.02,),


            Padding(
              padding: const EdgeInsets.only(left: 75,right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 20,width: 70,color: Colors.red[50],
                  child: Center(
                    child: Text("lebanese",
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 75,right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Opening hours [09:30Am -07:00Pm]",
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),

            Padding(
              padding: EdgeInsets.only(
                  right: 2,left: 24
              ),
              child: Container(color: Colors.grey,
                height: 1,width: MediaQuery.of(context).size.width*0.7,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 75,right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Description",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 75,right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("King of Grill",
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),

            Padding(
              padding: const EdgeInsets.only(left: 75,right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Favorite To",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 45,right: 10),            child: Row(

                  children:[
                    SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height:50,width: 50,
                        child: Card(
                          color:YellowColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),),
                          child: Center(child: Icon(FontAwesomeIcons.plus,size: 25,color: Colors.white,)),


                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height:50,width: 50,
                        child: Card(
                          color: Colors.red,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),),
                          child: Center(child: Icon(FontAwesomeIcons.c,size: 25,color: Colors.white,)),


                        ),
                      ),
                    ),

                  ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),

            ElevatedButton(
              onPressed: () {

              },
//

              child: const Text(
                'INVITE BUDDY ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-Bold'),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal:MediaQuery.of(context).size.width* 0.15,
                    vertical: MediaQuery.of(context).size.height * 0.018),
                primary: YellowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Padding(
              padding: const EdgeInsets.only(left: 75,right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Album",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
Row(children:[
  Image.asset("assets/images/hooka logo.png",height: 200,width: 200,),
  SizedBox(width: MediaQuery.of(context).size.width*0.04,),

  Image.asset("assets/images/hooka logo.png",height: 200,width: 200,)

])

          ],
        ),
      ),
    );
  }
}
