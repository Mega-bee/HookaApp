import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hooka/di/di_config.dart';
import 'package:hooka/home_page/ui/screens/home_screen.dart';
import 'package:injectable/injectable.dart';
import '../../../contact_us/ui/contactus.dart';
import '../../../invitations/ui/screen/invitations.dart';
import '../../../my_cart/widget/screen/MyCart.dart';
import '../../../my_orders/ui/Screen/myorders.dart';
import '../../../notifications/ui/screen/notifications.dart';
import '../../../settings/ui/settings.dart';
import 'menu_screen.dart';

@injectable
class DrawerScreen extends StatefulWidget {
  const DrawerScreen();
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}
class _DrawerScreenState extends State<DrawerScreen> {
 MenuItemm currentItem = MenuItems.MainScreen;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.defaultStyle,
      mainScreen: getScreen(),
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
Widget   getScreen() {
  switch  (currentItem) {
    case MenuItems.MainScreen :
      return getIt<HomeScreen>();
    case  MenuItems.settings:
      return getIt<Settings>();
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
    default :
      return getIt<HomeScreen>();
  }
}
}
