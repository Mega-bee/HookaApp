import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooka/auth/ui/widget/email_field.dart';
import 'package:hooka/auth/ui/widget/password_field.dart';

import '../../../utils/style/colors.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(children: [
        Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height * 0.15,
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
              SizedBox(height:MediaQuery.of(context).size.height * 0.02),

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
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: MediaQuery.of(context).size.height * 0.40,
                  child: SingleChildScrollView(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),),
                      elevation: 15,
                      child: SingleChildScrollView(
                        child: Column(
                            children:[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text("Sign up",style: TextStyle(fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),),


                                ),
                              ),

                              Align( alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 2,left: 24
                                  ),
                                  child: Container(color: Colors.black,
                                    height: 4,width: 35,
                                  ),
                                ),
                              ),
                              SizedBox(height: mediaQueryHeight*0.05,),
                               Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: mediaQueryWidth * 0.05),
                                      child: Form(
                                        key: _formKey,

                                        child: TextFormField(
                                        cursorColor: YellowColor,
                                        style: const TextStyle(fontSize: 14),
                                        controller:firstname,
                                        decoration: InputDecoration(

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
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                        ),
                                            validator: MultiValidator([
                                              RequiredValidator(errorText: 'First name Required *'),
                                              EmailValidator(errorText: 'Not a valid name'),
                                            ]),
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.emailAddress),
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
                                          controller:lastname,
                                          decoration: InputDecoration(

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
                                            RequiredValidator(errorText: 'Last name Required *'),
                                            EmailValidator(errorText: 'Not a valid Last name'),
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
                                          controller:Mobile,
                                          decoration: InputDecoration(

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
                                            RequiredValidator(errorText: 'Mobile number Required *'),
                                            EmailValidator(errorText: 'Not a valid number'),
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
                                          // autovalidateMode:
                                          //     AutovalidateMode.onUserInteraction,
                                          decoration: InputDecoration(

                                            hintText: " Password",
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

                                            hintText: " Confirm Password",
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

                                            RequiredValidator(errorText: 'Password Required *'),

                                          ]),
                                        )
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.03,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (newpass.text.isEmpty ||
                                            email.text.isEmpty ||
                                            newpass.text.length < 6) {
                                          _formKey.currentState!.validate();
                                        }
                                        // Fluttertoast.showToast(
                                        //     msg: getTranslate(context, 'fillField'),
                                        //     toastLength: Toast.LENGTH_SHORT,
                                        //     gravity: ToastGravity.BOTTOM,
                                        //     timeInSecForIosWeb: 1);

                                      },
//                             } Navigator.of(context).pushReplacement(MaterialPageRoute(
//                                  builder: (context) =>  Navigationbar()));

                                      child: const Text(
                                        'SIGN UP',
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




                                    SizedBox(height: mediaQueryHeight*0.04,),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:[ Text("Already have an account? ",style: TextStyle(color: Colors.grey),),
                                          TextButton(child: Text("SIGN IN",style: TextStyle(fontWeight: FontWeight.bold)),
                                          onPressed:()=> Navigator.pop(context),
                                          ),
                                        ]),
                                    SizedBox(height: mediaQueryHeight*0.04,),
                                  ],
                                ),

                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ]),
    );
  }
}
