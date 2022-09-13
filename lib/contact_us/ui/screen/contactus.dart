import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/contact_us/request/contactus_request.dart';
import 'package:hooka/contact_us/state_manager/contactus_state_manager.dart';
import 'package:hooka/contact_us/ui/state/contactus_init_state.dart';
import 'package:injectable/injectable.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';

import '../../../utils/style/colors.dart';

@injectable
class ScreenContactus extends StatefulWidget {
  final ContactUsCubit cubit;
  ScreenContactus(
    this.cubit,
  );

  @override
  State<ScreenContactus> createState() => ScreenContactusState();
}

class ScreenContactusState extends State<ScreenContactus> {
  late AsyncSnapshot loadingSnapshot;

  ContactUssss(ContactUsRequest request) {
    widget.cubit.ContactUs(this, request);
  }


  @override
  void initState() {
    super.initState();
    loadingSnapshot = AsyncSnapshot.nothing();
    widget.cubit.loadingStream.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshot = event;
        });
      }
    });
    widget.cubit.emit(ContactUsInitState(this));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: MenuWidget(),
          backgroundColor: Colors.white,
          title: Text(
            "ContactUs",
              style: GoogleFonts.comfortaa(color: Primarycolor,fontWeight: FontWeight.bold)
          ),
        ),
        body: BlocBuilder<ContactUsCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        ));
  }
}
