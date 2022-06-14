import 'package:flutter/material.dart';

import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:hooka/invitations/ui/widget/received_tab.dart';
import 'package:hooka/invitations/ui/widget/sent_tab.dart';
import 'package:hooka/utils/style/colors.dart';


class Invitations extends StatefulWidget {
  const Invitations({Key? key}) : super(key: key);

  @override
  State<Invitations> createState() => _InvitationsState();
}

class _InvitationsState extends State<Invitations>with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: MenuWidget(),
          backgroundColor: Colors.white,
          title: Text("Invitations",style: TextStyle(color: Colors.black),),

        ),
        body: Column(
          children:[
            Padding(
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
                          child: Center(child: Text('Received',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
                          child: Center(child: Text('Sent',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),

                  ),
                ),
              ),

            ),
          ),
    Container(
      height: MediaQuery.of(context).size.height*0.8,
      child: Flexible(
      flex: 10,
      child: SizedBox(
      height: (MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom) *
      0.9,
      width: double.maxFinite,
      child: TabBarView(
      controller: _tabController,
      children: [
        ReceivedTab(),
        SentTab(),

          ]))),
    )])

    );

  }
}

