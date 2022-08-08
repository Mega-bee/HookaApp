import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../utils/style/colors.dart';

@injectable
class About extends StatefulWidget {
  const About() ;

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
        onPressed: (){Navigator.of(context).pop();},
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
      backgroundColor: Colors.white,
      body:
      Column(children:[
        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
        Padding(
          padding: const EdgeInsets.only(right: 200),
          child: Text("About Us",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),
             ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.04,),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text("Hooka Times is a revolutionary concept that aims to \n"
                "enhance the enjoyment of shisha. We provide our \n"
               "customers with a new and exciting way to experience \n"
               "this centuries- old pastime by offering a smart and\n"
       "sophisticated social networking platform as well as a \n"
       "range of high-quality signature products. \n"
            "\n"
               "While viruses can spread by smoking traditional \n"
               "hookahs, our latest innovation eliminates the risk of \n"
              "contamination. The Hooka Times Quicky is a smart, \n"
             "convenient solution for those who wish to smoke on the \n"
               "go or in the comfort of their own homes. The single-use \n"
                "device comes fully equipped with coal and flavored \n"
              "tobacco, making it perfect for shisha moments \n"
             "anywhere, anytime. \n"
            "\n"
                "Rest assured that Hooka Times is a name you can trust. \n",style: TextStyle(fontSize: 12),),
          ),
        )
      ]),

    );
  }
}
