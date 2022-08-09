import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../../utils/components/custom_alert.dart';
import '../../../profile/ui/profile.dart';


class MenuItemm {
  final String title;
  final IconData icon;
  const MenuItemm(this.icon, this.title);
}

class MenuItems {
  static const MainScreen = MenuItemm(Icons.home, 'MainScreen');
  static const mycart = MenuItemm(Icons.shopping_basket, 'My Cart');
  static const myorder = MenuItemm(Icons.star_border, 'My Orders');
  static const invitations = MenuItemm(Icons.calendar_today, 'Invitations');
  static const notifications = MenuItemm(Icons.notifications, 'Notifications');
  static const contactus = MenuItemm(Icons.email, 'Contact us');
  static const settings = MenuItemm(Icons.settings, 'Settings');

  static final all = <MenuItemm>[
    MainScreen,
    mycart,
    myorder,
    invitations,
    notifications,
    contactus,
    settings,
  ];
}

class Menupage extends StatefulWidget {
  final MenuItemm currentItem;
  final ValueChanged<MenuItemm> onSelectedItem;
  const Menupage({
    required this.currentItem,
    required this.onSelectedItem,
  });

  @override
  State<Menupage> createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(title: Text('Personal Info'),),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, CustomPageRoute(child: Profile()));
                },
                child: Row(children: [
                  CircleAvatar(
                      backgroundColor: YellowColor,
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    "Christian Zakhour",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ...MenuItems.all.map(buildMenuItemms).toList(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomLogOutDialog(
                      title: "Are You Sure Do You Want To logout",
                      content: "",
                      yesBtn: () {
//                        Navigator.of(context).pushAndRemoveUntil(
//                            MaterialPageRoute(
//                                builder: (context) => loginScreen()),
//                            (route) => false);
                      },
                      noBtn: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
                child: Row(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.logout,
                        color: YellowColor,
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              Spacer(
                flex: 1,
              )
            ],
          ),
        ));
  }

  Widget buildMenuItemms(MenuItemm item) => ListTile(
        selectedTileColor: YellowColor,
        selected: widget.currentItem == item,
        textColor: Colors.white,
        iconColor: YellowColor,
        minLeadingWidth: 20,

        selectedColor: Colors.black,
        leading: Icon(item.icon),
        title: Text(item.title),
        onTap: () {
          widget.onSelectedItem(item);
        },
      );
}
