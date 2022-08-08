import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/auth_routes.dart';
import 'package:hooka/auth/request/login_request.dart';
import 'package:hooka/auth/ui/screens/login_screen.dart';
import 'package:hooka/auth/ui/widget/email_field.dart';
import 'package:hooka/auth/ui/widget/password_field.dart';
import 'package:hooka/generated/l10n.dart';
import 'package:hooka/utils/style/colors.dart';
import '../widget/custem_button.dart';

class LoginInitState extends States{
  final loginScreenState _screenState;
  String? errorMessage;


  LoginInitState(this._screenState,this.errorMessage);

  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();


  @override
  Widget getUI(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
return  SingleChildScrollView(
  child: Column(children: [
    Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.162,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                  "Please enter your email and password to \n"
                      "login to HookaApp.",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ],
      ),
    ),
    Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.10,
        color: Colors.black,
      ),
      SingleChildScrollView(
        child: Center(
          child: Container(
//            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.height * 0.42,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 15,
              child: Column(children: [
               const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 2, left: 24),
                    child: Container(
                      color: Colors.black,
                      height: 4,
                      width: 35,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQueryHeight * 0.03,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaQueryWidth * 0.05),
                        child: EmailField(email: email),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.02,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: mediaQueryWidth * 0.05,
                          ),
                          child: PasswordField(
                            password: password,
                          )),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.01,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(20, 0, 15, 0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: Text("Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey)),
                              onPressed: () {
//                                  Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) =>
//                                          const PinCodeVerificationScreen(
//                                            phoneNumber: "",
//                                          )));
                              },
                            )),
                      ),
//                        Padding(
//                          padding: EdgeInsets.symmetric(
//                            vertical: mediaQueryHeight * 0.03,
//                          ),
//                          child: ElevatedButton(
//                            onPressed: () {
//                              if (password.text.isEmpty ||
//                                  email.text.isEmpty ||
//                                  password.text.length < 6) {
//                                _formKey.currentState!.validate();
//                              }
//                              _screenState.loginRequest(LogRequest(email.text, password.text));
//                              // Navigator.pushReplacement(context,
//                              //     MaterialPageRoute(
//                              //   builder: (context) {
//                              //     return const PinCodeVerificationScreen();
//                              //   },
//                              // ));
//                            },
//                            child: Center(
//                              child: Text('LOGIN',
//                                  style: TextStyle(
//                                      color: Colors.black,
//                                      fontSize: 14,
//                                      fontWeight: FontWeight.w500,
//                                      fontFamily: 'Roboto-Bold'),
//                                  textAlign: TextAlign.left),
//                            ),
//                            style: ElevatedButton.styleFrom(
//                              // padding: EdgeInsets.symmetric(
//                              //     horizontal: mediaQueryWidth * 0.23,
//                              //     vertical: mediaQueryHeight * 0.018),
//                              primary: YellowColor,
//                              shape: RoundedRectangleBorder(
//                                borderRadius:
//                                BorderRadius.circular(10.0),
//                              ),
//                            ),
//                          ),
//                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          buttonTab: () {
                            if (password.text.isEmpty ||
                                email.text.isEmpty ||
                                password.text.length < 6) {
                              _formKey.currentState!.validate();
                            }
                            _screenState.loginRequest(LogRequest(email.text, password.text));
                          },
                          loading: _screenState.loadingSnapshot.connectionState ==
                              ConnectionState.waiting,
                          text: 'Login',
                          bgColor: YellowColor,
                          textColor: Colors.black,
                        ),
                      ),

                      SizedBox(
                        height: mediaQueryHeight * 0.02,
                      ),
                      errorMessage==null?
                      Container():
                      Text("${errorMessage}",style: TextStyle(color: Colors.red),),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.03,
                      ),
                      Center(
                        child: Text(
                          "or login with",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            child: Card(
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                  child: Image.asset(
                                    "assets/images/1534129544.png",
                                    width: 25,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: mediaQueryWidth * 0.03,
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            child: Card(
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                  child: Icon(
                                    FontAwesomeIcons.facebookF,
                                    size: 25,
                                    color: Colors.blue[900],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.02,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                color: Colors.black,
                                  decoration: TextDecoration.underline
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, AuthRoutes.SIGNUP_SCREEN);
//                                  Navigator.push(
//                                      context,
//                                      CustomPageRoute(
//                                          child: SignupScreen()));
                              },
                            ),
                          ]),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    ]),
  ]),
);
  }
}