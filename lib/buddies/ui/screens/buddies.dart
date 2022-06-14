import 'package:flutter/material.dart';

import '../../../utils/style/colors.dart';
import '../widget/buddies_card.dart';

class Buddies extends StatefulWidget {
  const Buddies({Key? key}) : super(key: key);

  @override
  State<Buddies> createState() => _BuddiesState();
}

class _BuddiesState extends State<Buddies> {
  @override
  Widget build(BuildContext context) {
    final _searchController =TextEditingController();
    return  Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Buddies',style: TextStyle(color: Primarycolor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,color: Primarycolor,size: 35,),
          onPressed: (){Navigator.of(context).pop();},

        ),
        actions: [
          TextButton(onPressed: (){}, child: Text("Map",style: TextStyle(fontSize: 14),))
        ],
      ) ,
      body:  Column(
          children:[
            SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: TextField(
                controller: _searchController,
                autofocus: false,
                onChanged: (searchText) {
                  // searchText = searchText.toLowerCase();
                  // print(searchText);
                  // print("search test");
                  //
                  // pat = patient
                  //     .where(
                  //       (string) =>
                  //       (string.firstName! + string.middleName! + string.lastName!).toLowerCase().contains(
                  //         searchText.toLowerCase(),
                  //       ),
                  // )
                  //     .toList();
                  // setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical:
                      MediaQuery.of(context).size.height * 0.01),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor)),
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: const Color.fromRGBO(18, 108, 242, 1),
                  hintText: 'Search ',
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.filter_alt_rounded,
                        color: YellowColor,
                      ),
                      onPressed: () {}
                    //   showModalBottomSheet(
                    //
                    //     backgroundColor: Colors.white,
                    //     elevation: 3,
                    //     shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.vertical(
                    //         top: Radius.circular(25),
                    //       ),
                    //     ),
                    // context: context,
                    // builder: (context) {
                    //   return ShowFilter(
                    //     filtersValue: selectedFilter,
                    //     filtersValueTitle: selectedFilterTitle,
                    //     onDonTap: (filterListID ,filterListTitle) {
                    //       selectedFilter  = List.from(filterListID) ;
                    //       selectedFilterTitle  = List.from(filterListTitle) ;
                    //       setState(() {
                    //
                    //       });
                    //       patientListBloc
                    //         ..add(FetchData(
                    //             Urls.GET_ALL_PATIENTS_Priority,
                    //             query: WebParam.FilterParams(selectedFilter),
                    //             requestType: RequestType.get));
                    //     },
                    //   );
                    // },
                    //   );
                    // },
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                  ),
                  prefixIconColor: const Color.fromRGBO(157, 157, 157, 1),
                  hintStyle: const TextStyle(
                      color: Color.fromRGBO(157, 157, 157, 1),
                      fontSize: 15,
                      fontFamily: 'Roboto-Regular'),
                ),
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),

            Expanded(
              child: Card(

                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return BuddiesCard();



                      })),






            )




          ]),
    );
  }
}
