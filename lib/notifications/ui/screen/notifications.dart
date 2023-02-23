import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../auth/HiveSetUp.dart';
import '../../../auth/auth_routes.dart';
import '../../../di/di_config.dart';
import '../../../utils/style/colors.dart';
import '../../state_manager/notification_state_manager.dart';
@injectable
class Notifications extends StatefulWidget {
final NotificationCubit cubit;
Notifications(this.cubit);


  @override
  State<Notifications> createState() => NotificationsState();
}

class NotificationsState extends State<Notifications> {
  @override
  void initState() {
    super.initState();

    widget.cubit.getNotification(this,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("Notifications",style: TextStyle(color: Colors.black),),

      ),
      body:  getIt<AuthPrefsHelper>().isSignedIn()?BlocBuilder<NotificationCubit, States>(
    bloc: widget.cubit,
    builder: (context, state) {
    return state.getUI(context);
    },



    ):InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AuthRoutes.LOGIN_SCREEN,
          );
        },
        child: Center(
          child: Text(
            "Please log in",
            style: GoogleFonts.comfortaa(
              color: Primarycolor,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }
}
