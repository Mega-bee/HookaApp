import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:hooka/invitations/ui/screen/received_tab.dart';
import 'package:hooka/invitations/ui/screen/sent_tab.dart';
import 'package:hooka/utils/style/colors.dart';
import 'package:injectable/injectable.dart';

import '../../../di/di_config.dart';

@injectable
class Invitations extends StatefulWidget {
  @override
  State<Invitations> createState() => _InvitationsState();
}

class _InvitationsState extends State<Invitations>
    with TickerProviderStateMixin  {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: MenuWidget(),
          backgroundColor: Colors.white,
          title: Text(
            "Invitations",
            style:  GoogleFonts.comfortaa(color: Colors.black),
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
                      indicatorColor: Colors.black,
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
                            'Received',
                            style:  GoogleFonts.anekLatin(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Center(
                              child: Text('Sent',
                                  style:  GoogleFonts.anekLatin(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500))),
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
              color: Colors.grey[100],

              height: MediaQuery.of(context).size.height * 0.8,
              child: SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          MediaQuery.of(context).padding.bottom) *
                      0.9,
                  child: TabBarView(controller: _tabController, children: [
                    getIt<ReceivedTab>(),
                    getIt<SentTab>(),
                  ])),
            ),
          )
        ]));
  }




}
