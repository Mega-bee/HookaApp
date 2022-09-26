
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooka/auth/ui/widget/custem_button.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../../utils/style/colors.dart';
import '../../request/forgot_request.dart';
import '../../state_manager/forgot_pass_state_manager.dart';
import '../../state_manager/forgot_screen_state_manager.dart';
@injectable
class ForgotScreen extends StatefulWidget {
final ForgotScreenCubit cubit;
ForgotScreen(this.cubit);
  @override
  State<ForgotScreen> createState() => ForgotScreenState();
}

class ForgotScreenState extends State<ForgotScreen> {
  late AsyncSnapshot loadingSnapshot;

  bool flags=true;
  String? email;
  final _formKey4 = GlobalKey<FormState>();
  final Newpass = TextEditingController();
  final Confpass = TextEditingController();
  void Forget(ForgotRequest request){
    widget.cubit.ForgotPassScreen(request,this);
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
    });}
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is String) {
         email = args;


      }
      flags = false;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(

          onPressed: (){
            Navigator.pop(context);

          },

          icon: Icon(CupertinoIcons.back,size: 25,),
        ),
        title: Text("Forgot Password",style: GoogleFonts.comfortaa(color: Colors.black),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Form(
            key: _formKey4,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  // Text("Your email is ${email}"),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text("Enter Your New Password",style: GoogleFonts.alef(fontSize: 22),),
                ),
                  SizedBox(height: 60,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 14),
                        controller: Newpass,
                        decoration: InputDecoration(
                          labelText: "New Password",

                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:Colors.black)),
                          filled: true,
                          fillColor: Colors.white,
                          hintText:  "New Password",
                          hintStyle: GoogleFonts.alef(),
                          labelStyle: GoogleFonts.alef(color: Colors.black),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'New Password Required *'),
                        ]),
                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.05),
                    child: TextFormField(
                        cursorColor: YellowColor,
                        style: const TextStyle(fontSize: 14),
                        controller: Confpass,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:Colors.black)),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: " Confirm Password",
                          hintStyle: GoogleFonts.alef(),
                          labelStyle: GoogleFonts.alef(color: Colors.black),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.black12)),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Password Required *'),
                        ]),
                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text),
                  ),
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25),
                    child: CustomButton(bgColor: YellowColor, text: "Save Password", textColor: Colors.black,

                        loading: loadingSnapshot.connectionState ==
                            ConnectionState.waiting, buttonTab: (){
if(Confpass.text==Newpass.text) {
  Forget(ForgotRequest(email, Confpass.text,));
}
                    else {
                      Fluttertoast.showToast(msg: "Passwords Don\'t Match");
}
                    }),
                  )
    ],
    ),
          ),
        ),
      )
    );
  }
}
