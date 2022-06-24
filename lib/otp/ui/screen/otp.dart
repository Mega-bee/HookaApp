import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooka/home_page/ui/screens/drawer_screen.dart';
import 'package:hooka/utils/style/colors.dart';

import 'package:pin_code_fields/pin_code_fields.dart';




class PinCodeVerificationScreen extends StatefulWidget {
  final String? phoneNumber;

  const PinCodeVerificationScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,

      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,

        title: Text("Otp Verification",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                 SizedBox(height: MediaQuery.of(context).size.height*0.02),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/images/hooka_logo.png',fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Phone Number Verification',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: "Enter the code sent to ",
                        children: [
                          TextSpan(
                              text: "Your Mobile Number",
                              style: const TextStyle(
                                  color: Colors.red,

                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ],
                        style:
                        const TextStyle(color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),

                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 50),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: YellowColor,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: true,
                        obscuringCharacter: '*',
                        obscuringWidget: Image.asset("assets/images/shisha.png",width: 20),

                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 40,
                          fieldWidth: 60,
                          activeFillColor: Colors.white,
                          activeColor: Colors.black,
                           selectedColor: Colors.black,
                          selectedFillColor: Colors.white,
                          inactiveColor: YellowColor,
                          disabledColor: Colors.black,inactiveFillColor: Colors.black
                        ),
                        cursorColor:YellowColor,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't receive the code? ",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () => snackBar("OTP resend!!"),
                      child:  Text(
                        "RESEND",
                        style: TextStyle(
                            color: YellowColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.02),

                Container(

                  margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60),
                  child: ButtonTheme(

                    height: 20,
                    child: TextButton(
                      onPressed: () {
                        formKey.currentState!.validate();
                        // conditions for validating
                        if (currentText.length != 4 || currentText != "1234") {
                          errorController!.add(ErrorAnimationType
                              .shake); // Trigg

                          // ering error shake animation
                          setState(() => hasError = true);
                        } else {
                          setState(
                                () {
                              hasError = false;

                              snackBar("OTP Verified!!",);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DrawerScreen()),
                              );
                            },
                          );
                        }
                      },
                      child: Center(
                          child: Text(
                            "VERIFY".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  decoration: BoxDecoration(

                      color: YellowColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(

                            color: YellowColor,
                            offset: const Offset(1, -1),
                            blurRadius: 1),
                        BoxShadow(
                            color:YellowColor,
                            offset: const Offset(-1, 2),
                            blurRadius: 1)
                      ]),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        child: TextButton(
                          child: const Text("Clear"),
                          onPressed: () {
                            textEditingController.clear();
                          },
                        )),
                    Flexible(
                        child: TextButton(
                          child: const Text("Set Text"),
                          onPressed: () {
                            setState(() {
                              textEditingController.text = "1234";
                            });
                          },
                        )),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.2,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}