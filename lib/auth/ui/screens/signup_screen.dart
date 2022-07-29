import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooka/Model/SignUpModel.dart';
import 'package:hooka/auth/ui/screens/login_screen.dart';
import 'package:hooka/auth/ui/widget/email_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../Model/OtpModel.dart';
import '../../../Network/DataLoaderBlock.dart';
import '../../../Network/WebParam.dart';
import '../../../Network/WebUrl.dart';
import '../../../otp/ui/screen/otp.dart';
import '../../../utils/style/colors.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final newpass = TextEditingController();
  final confirmpass = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final Mobile = TextEditingController();

  String validatePass(value) {
    if (value.isEmpty) {
      return 'Required *';
    }
    return "";
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery
        .of(context)
        .size
        .height;
    var mediaQueryWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: BlocProvider(
        create: (BuildContext context) => DataLoaderBloc(Default()),
        child: Column(children: [
          Container(
          color: Colors.black,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.18,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Let's Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 37,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "Please enter your email and password to signup for HookaApp.",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02),

            ],
          ),
        ),
        Stack(
            children: [
        Container( height: MediaQuery.of(context).size.height * 0.10,
        color: Colors.black,
      ),
      Center(

        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.68,
          width: MediaQuery
              .of(context)
              .size
              .height * 0.40,
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),),
              elevation: 15,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Sign up", style: TextStyle(fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),),


                      ),
                    ),

                    Align(alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 2, left: 24
                        ),
                        child: Container(color: Colors.black,
                          height: 4, width: 35,
                        ),
                      ),
                    ),
                    SizedBox(height: mediaQueryHeight * 0.05,),
                    Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                  cursorColor: YellowColor,
                                  style: const TextStyle(fontSize: 14),
                                  controller: firstname,
                                  decoration: InputDecoration(
                                    labelText: "First Name",
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: " First name",
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 0, color: Colors.black12)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(
                                          10.0),
                                    ),
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'First name Required *'),
                                  ]),
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.emailAddress),
                            ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaQueryWidth * 0.05),
                            child: TextFormField(
                                cursorColor: YellowColor,
                                style: const TextStyle(fontSize: 14),
                                controller: lastname,
                                decoration: InputDecoration(
                                labelText: "Last name",
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: " Last name",
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                                      errorText: 'Last name Required *'),
                                ]),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.emailAddress),
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaQueryWidth * 0.05),
                            child: EmailField(email: email),
                          ),

                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaQueryWidth * 0.05),
                            child: TextFormField(
                                cursorColor: YellowColor,
                                style: const TextStyle(fontSize: 14),
                                controller: Mobile,
                                decoration: InputDecoration(
                                  labelText: "Mobile",
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: " Mobile",
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                                      errorText: 'Mobile number Required *'),
                                ]),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.phone),
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaQueryWidth * 0.05),
                            child: TextFormField(
                              cursorColor: YellowColor,
                              style: const TextStyle(fontSize: 14),
                              obscureText: _isObscure,
                              controller: newpass,
                              decoration: InputDecoration(

                                hintText: " Password",
                                labelText: "Password",
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.black12,

                                  ),
                                ),

                                filled: false,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(),
                                  borderRadius: BorderRadius.circular(10.0),

                                ),
                              ),
                              validator: validatePass,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaQueryWidth * 0.05),
                              child: TextFormField(
                                cursorColor: YellowColor,
                                style: const TextStyle(fontSize: 14),
                                obscureText: _isObscure,
                                controller: confirmpass,
                                // autovalidateMode:
                                //     AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(

                                  hintText: " Confirm Password",
                                  labelText: "Confirm password",
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      width: 0,
                                      color: Colors.black12,

                                    ),
                                  ),

                                  filled: false,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(10.0),

                                  ),
                                ),
                                validator: MultiValidator([

                                  RequiredValidator(
                                      errorText: 'Password Required *'),

                                ]),
                              )
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03,
                          ),
                          BlocConsumer<DataLoaderBloc, GlobalState>(
                              listener: (context, state) {
                                if (state is Error) {
                                  Fluttertoast.showToast(
                                      msg: state.errorMessage);
                                }
                                else if (state is ConnectionError) {
                                  MotionToast.error(
                                      title: Text("Hookah",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),),
                                      description: Text("Connection error")
                                    //  animationType: ANIMATION.FROM_LEFT,
                                  )
                                      .show(context);
                                }
                                else if (state is Successfully) {
                                  print(state.data);
                                  print("christiannnnnnnnnn:  helloooooo");

                                  print(
                                      '-------------------------------------------');
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return PinCodeVerificationScreen(phoneNumber:Mobile.text);
                                      },),);
                                }
                              },
                              builder: (context, state) {
                                if(state is Default){
                                  print("default");
                            return ElevatedButton(
                              onPressed: () {
                                if (newpass.text.isEmpty ||
                                    email.text.isEmpty ||
                                    newpass.text.length < 6) {
                                  _formKey.currentState!.validate();
                                }
                                BlocProvider.of<DataLoaderBloc>(context).add(
                                FetchData(Urls.SIGNUP,
                                body: WebParam.SignUpParams(email.text, newpass.text, firstname.text, lastname.text, Mobile.text, confirmpass.text),
                                requestType: RequestType.post));
                                BlocProvider.of<DataLoaderBloc>(context).add(
                                    FetchData(
                                        Urls.GENERATE_OTP,
                                        body: WebParam.GenerateOTp(Mobile.text

                                        ),
                                        requestType: RequestType.post));

                              },
                              child: Center(
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto-Bold'),
                                ),),
                              style: ElevatedButton.styleFrom(
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: mediaQueryWidth * 0.23,
                                //     vertical: mediaQueryHeight * 0.018),
                                primary: YellowColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            );
                          }
                                else if (state is Loading){
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: mediaQueryHeight * 0.03,
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child:LoadingAnimationWidget.twistingDots(leftDotColor: Colors.black, rightDotColor: Colors.yellow, size: 32),


                                    ),
                                  );
                                }
                                else {
                                  return ElevatedButton(
                                    onPressed: () {
                                      if (newpass.text.isEmpty ||
                                          email.text.isEmpty ||
                                          newpass.text.length < 6) {
                                        _formKey.currentState!.validate();
                                      }
                                      BlocProvider.of<DataLoaderBloc>(context).add(
                                          FetchData(Urls.SIGNUP,
                                              body: WebParam.SignUpParams(
                                                  email.text, newpass.text, firstname.text, lastname.text, Mobile.text, confirmpass.text),
                                              requestType: RequestType.post));
                                      BlocProvider.of<DataLoaderBloc>(context).add(
                                          FetchData(
                                              Urls.GENERATE_OTP,
                                              body: WebParam.GenerateOTp(Mobile.text

                                              ),
                                              requestType: RequestType.post));
                                    },
                                    child: Center(
                                      child: Text(
                                        'SIGN UP',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto-Bold'),
                                      ),),
                                    style: ElevatedButton.styleFrom(
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: mediaQueryWidth * 0.23,
                                      //     vertical: mediaQueryHeight * 0.018),
                                      primary: YellowColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  );
                                }
                              })
                        ]),
                    SizedBox(height: mediaQueryHeight * 0.04,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",
                            style: TextStyle(color: Colors.grey),),
                          TextButton(child: Text("SIGN IN", style: TextStyle(
                              fontWeight: FontWeight.bold)),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ]),
                    SizedBox(height: mediaQueryHeight * 0.04,),
                  ],
                ),

                ),
          ),
        ),
      ),)
    ]),
    ]),
    ),
    );
  }
}
