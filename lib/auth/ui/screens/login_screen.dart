import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooka/auth/ui/screens/signup_screen.dart';
import 'package:hooka/auth/ui/widget/email_field.dart';
import 'package:hooka/auth/ui/widget/password_field.dart';

import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../../home_page/ui/screens/drawer_screen.dart';
import '../../../home_page/ui/screens/main_screen.dart';
import '../../../otp/ui/screen/otp.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    final email = TextEditingController();

    final password = TextEditingController();

    String validatePass(value) {
      if (value.isEmpty) {
        return 'Required *';
      }
      return "";
    }

    bool _isObscure = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      
      body: SingleChildScrollView(
        child: Column(children: [
          Container(

            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.15,
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
                            "login HookApp.",
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
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.height * 0.42,
                child: SingleChildScrollView(
                  child: Card(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 15,



                    child: SingleChildScrollView(
                      child: Column(children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
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

                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: mediaQueryWidth * 0.05),
                                child: EmailField(email: email),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mediaQueryWidth * 0.05,


                                  ),
                                  child: PasswordField(
                                    password: password,
                                  )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      child: Text("Forgot Password?",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                            builder: (context) => const PinCodeVerificationScreen()));
                                      },
                                    )),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const PinCodeVerificationScreen()),
                                  );
                                  // if (password.text.isEmpty ||
                                  //     email.text.isEmpty ||
                                  //     password.text.length < 6) {
                                  //   _formKey.currentState!.validate();
                                  // }
                                  // Fluttertoast.showToast(
                                  //     msg: getTranslate(context, 'fillField'),
                                  //     toastLength: Toast.LENGTH_SHORT,
                                  //     gravity: ToastGravity.BOTTOM,
                                  //     timeInSecForIosWeb: 1);
                                },
//                             } Navigator.of(context).pushReplacement(MaterialPageRoute(
//                                  builder: (context) =>  Navigationbar()));

                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto-Bold'),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mediaQueryWidth * 0.23,
                                      vertical: mediaQueryHeight * 0.018),
                                  primary: YellowColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
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
                                        borderRadius: BorderRadius.circular(30.0),
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
                                        borderRadius: BorderRadius.circular(30.0),
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
                                        style:
                                            TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            CustomPageRoute(child: SignupScreen()));
                                      },
                                    ),
                                  ]),
                              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
