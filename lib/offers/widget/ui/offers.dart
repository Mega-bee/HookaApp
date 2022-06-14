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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text("Offers",style: TextStyle(color: Primarycolor)),
        elevation: 0,
backgroundColor: Colors.white,
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (4 / 4),
    crossAxisSpacing: 20,
    mainAxisSpacing: 10),
    itemCount: 2,
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

                    Image.asset("assets/images/Unknown.jpeg", height: 100),
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
