import 'package:flutter/material.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';

import 'package:hooka/utils/style/colors.dart';
import 'package:injectable/injectable.dart';

import '../../../di/di_config.dart';
import 'allorder_tab.dart';
import 'current_tab.dart';

@injectable
class MyOrder extends StatefulWidget {
  @override
  State<MyOrder> createState() => MyOrderState();
}

class MyOrderState extends State<MyOrder>
    with TickerProviderStateMixin  {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: MenuWidget(),
          backgroundColor: Colors.white,
          title: Text(
            "My Order",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 0,
            ),
            child: DefaultTabController(
              length: 2,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
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
                      labelStyle:
                          TextStyle(fontSize: 16, fontFamily: 'Roboto-Medium'),
                      tabs: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Center(
                              child: Text(
                            'Current',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Center(
                              child: Text('All order',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          MediaQuery.of(context).padding.bottom) *
                      0.9,
                  child: TabBarView(controller: _tabController, children: [
                    getIt<CurrentTab>(),
                    getIt<AllOrderTabb>(),
                  ])),
            ),
          )
        ]));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
