import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:hooka/my_orders/ui/Widget/OrderWidget.dart';
import 'package:hooka/utils/style/colors.dart';


class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,

        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("MyOrders",style: TextStyle(color: Colors.black),),

      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 0,

        ),
        child: DefaultTabController(
            length: 2,

            child:Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,


              ),
              child: Container(

                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black12))),
                height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom) *
                    0.07,
                width: 500,

                child: Container(
                  child: TabBar(
                    controller: _tabController,


                    isScrollable: true,
                    indicatorColor: YellowColor,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(
                        fontSize: 16, fontFamily: 'Roboto-Medium'),
                    tabs: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Center(child: Text('Current',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                      ),

                      // Container(
                      //   child: Expanded(
                      //     child: ListView.builder(
                      //       itemCount: 5,
                      //         itemBuilder: (context, index) {
                      //           return ValueListenableBuilder<Box<ShopModel>>(
                      //             valueListenable: Boxes.addToCart().listenable(),
                      //             builder: (context, box, _) {
                      //               final shopModel = box.values.toList().cast<ShopModel>();
                      //               return OrderWidget(context, shopModel);
                      //             },
                      //           ),
                      //         }) ,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),

            ),
      )

      );

  }
}
