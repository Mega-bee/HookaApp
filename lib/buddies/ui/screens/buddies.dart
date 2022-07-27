import 'package:flutter/material.dart';
import 'package:hooka/buddies/Model/BuddiesData.dart';

import '../../../utils/style/colors.dart';
import '../../Model/BuddiesModel.dart';
import '../widget/SearchWidgetBuddies.dart';
import '../widget/buddies_card.dart';

class Buddies extends StatefulWidget {
  const Buddies({Key? key}) : super(key: key);

  @override
  State<Buddies> createState() => _BuddiesState();
}

class _BuddiesState extends State<Buddies> {
  late List<BuddiesModel> buddiesModel;
  String query = '';

  @override
  void initState() {
    super.initState();

    buddiesModel = BuddiesList;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(

        elevation: 1,
        backgroundColor: Colors.white,
        title: Text('Buddies',style: TextStyle(color: Primarycolor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},

        ),
        actions: [
          TextButton(onPressed: (){}, child: Text("Map",style: TextStyle(fontSize: 18),))
        ],
      ) ,
      body:  Column(
          children:[
            SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: SearchWidgetBuddies(
                hintText: "Search",
                onChanged: searchBuddies,
                  text: query,
              ) ),
            SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),

            Expanded(
              child: Card(

                  child: ListView.builder(
                      itemCount: buddiesModel.length,
                      itemBuilder: (context, index) {
                        final BuddiesList = buddiesModel[index];
                        return BuddiesCard(BuddiesList);
                      })),






            )




          ]),
    );
  }
  void searchBuddies(String query) {
    final Buddies = BuddiesList.where((BuddiesModel) {
      final nameLower = BuddiesModel.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.buddiesModel = Buddies;
    });
  }
}
