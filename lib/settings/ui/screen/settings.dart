import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';

import '../../../utils/style/colors.dart';
import '../../state_manager/setting_state_manager.dart';
import '../../../home_page/ui/widget/menu_widget.dart';

@injectable
class Settings extends StatefulWidget {
 final SettingCubit cubit;
 Settings(this.cubit);

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getSetting(this);
  }
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  Availableeee(){
    widget.cubit.IsAvailable(this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Settings",style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold),),

      ),
      body:BlocBuilder<SettingCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          })




    );
  }
}
