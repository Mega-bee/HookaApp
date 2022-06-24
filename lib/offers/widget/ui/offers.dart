import 'package:flutter/material.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:hooka/utils/style/text_style.dart';

import '../screen/offers_screens.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text("Offers",style: TextStyle(color: Primarycolor)),
        elevation: 1,
backgroundColor: Colors.white,
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (4 / 4),
    crossAxisSpacing: 50,
    mainAxisSpacing: 30),
    itemCount: 9,
    itemBuilder: (context, index) {
          return
            InkWell(
              onTap:(){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  OffersScreen()),
              );},
              child: Card(

                  color: Colors.black,
                  child: Column(children: [

                    Image.asset("assets/images/Unknown.jpeg", height: 70),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02,),
                    Text("King Of Grill", style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02,),

                    Text("Discount 35%", style: TextStyle(
                        color: Colors.grey[500], fontStyle: FontStyle.italic),),
                  ])


              ),
            );
    }),
        ),
      ));
     

  }
}
