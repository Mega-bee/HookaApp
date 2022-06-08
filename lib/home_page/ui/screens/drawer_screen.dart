import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooka/Helpers/colors.dart';
import 'package:hooka/auth/ui/screens/login_screen.dart';
import 'package:hooka/home_page/ui/menu%20screens/MyAccount.dart';
import 'package:hooka/home_page/ui/menu%20screens/MyCart.dart';
import 'package:hooka/home_page/ui/menu%20screens/contactus.dart';
import 'package:hooka/home_page/ui/menu%20screens/invitations.dart';
import 'package:hooka/home_page/ui/menu%20screens/settings.dart';

import '../../../Custom_page_route.dart';
import '../menu screens/myorders.dart';
import '../menu screens/notifications.dart';
import '../widget/menu_widget.dart';
import 'main_screen.dart';
import 'main_screen.dart';
import 'menu_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}
class _DrawerScreenState extends State<DrawerScreen> {
final _drawerController =ZoomDrawerController();
MenuItem currentItem = MenuItems.MainScreen;
  @override
  Widget build(BuildContext context) {

    return ZoomDrawer(


      style: DrawerStyle.defaultStyle,


      mainScreen: getScreen()!,
      menuScreen: Builder(

        builder:(context)=> Menupage(currentItem:currentItem,
        onSelectedItem:(item){
          setState(() {
            currentItem=item;
            ZoomDrawer.of(context)!.close();
          });
        }
        ),
      ),
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.black,


    );

  }
Widget?  getScreen() {
  switch  (currentItem) {
     case  MenuItems.MainScreen:
      return MainScreen();
    case  MenuItems.settings:
      return Settings();
    case  MenuItems.myaccount:
      return MyAccount();
    case  MenuItems.mycart:
      return MyCart();
    case  MenuItems.myorder:
      return MyOrders();
    case  MenuItems.notifications:
      return Notifications();
    case  MenuItems.contactus:
      return Contactus();
    case  MenuItems.invitations:
      return Invitations();
  }
}
}
