import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/request/gen_otp_request.dart';
import 'package:hooka/auth/request/signup_request.dart';
import 'package:hooka/auth/ui/screens/signup_screen.dart';

import '../../../utils/style/colors.dart';
import '../widget/email_field.dart';

class SignupInitState extends States{
  final SignupScreenState screenState;

  String? errorMessage;
  SignupInitState(this.screenState,this.errorMessage);

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
  Widget getUI(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height * 0.18,
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
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                  "Please enter your email and password to signup for HookaApp.",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
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
            height: MediaQuery.of(context).size.height * 0.68,
            width: MediaQuery.of(context).size.height * 0.40,
            child: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 15,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Sign up",
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
                        height: mediaQueryHeight * 0.05,
                      ),
                      Column(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQueryWidth * 0.05),
                          child: TextFormField(
                              cursorColor: YellowColor,
                              style: const TextStyle(fontSize: 14),
                              controller: firstname,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:Colors.black)),
                                labelText: "First Name",
                                labelStyle: TextStyle(color: Colors.black),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: " First name",
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
                                    errorText: 'First name Required *'),
                              ]),
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQueryWidth * 0.05),
                          child: TextFormField(
                              cursorColor: YellowColor,
                              style: const TextStyle(fontSize: 14),
                              controller: lastname,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:Colors.black)),
                                labelText: "Last name",
                                filled: true,
                                fillColor: Colors.white,
                                hintText: " Last name",
                                labelStyle: TextStyle(color: Colors.black),
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
                                    errorText: 'Last name Required *'),
                              ]),
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQueryWidth * 0.05),
                          child: EmailField(email: email),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
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
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:Colors.black)),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: " Mobile",
                                labelStyle: TextStyle(color: Colors.black),
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
                                    errorText: 'Mobile number Required *'),
                              ]),
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.phone),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
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
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:Colors.black)),
                              hintText: " Password",
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.black),
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
                          height: MediaQuery.of(context).size.height * 0.03,
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
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:Colors.black)),
                                hintText: " Confirm Password",
                                labelText: "Confirm password",
                                labelStyle: TextStyle(color: Colors.black),
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
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              if (newpass.text.isEmpty ||newpass.text ==confirmpass.text ||
                                  email.text.isEmpty ||
                                  newpass.text.length < 6) {
                                _formKey.currentState!.validate();
                              }
                              screenState.SignupRequest(SignRequest(
                                  email.text,
                                  newpass.text,
                                  Mobile.text,
                                  firstname.text,
                                  confirmpass.text,
                                  lastname.text));
//                            screenState.GenerateOtpRequest(GenOtpRequest(Mobile.text));

                            },
                            child: Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto-Bold'),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: mediaQueryWidth * 0.23,
                              //     vertical: mediaQueryHeight * 0.018),
                              primary: YellowColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        )
                      ]),
                      SizedBox(
                        height: mediaQueryHeight * 0.04,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              child: Text("SIGN IN",
                                  style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,

                                      fontWeight: FontWeight.bold)),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ]),
                      SizedBox(
                        height: mediaQueryHeight * 0.04,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    ]);
  }

}