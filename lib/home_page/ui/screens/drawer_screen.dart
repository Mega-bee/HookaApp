import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../contact_us/ui/contactus.dart';
import '../../../invitations/ui/screen/invitations.dart';
import '../../../my_cart/widget/screen/MyCart.dart';
import '../../../my_orders/myorders.dart';
import '../../../notifications/ui/notifications.dart';
import '../../../settings/ui/settings.dart';
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
