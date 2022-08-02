import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hooka/auth/ui/screens/signup_screen.dart';
import 'package:hooka/auth/ui/widget/email_field.dart';
import 'package:hooka/auth/ui/widget/password_field.dart';
import 'package:hooka/home_page/ui/screens/drawer_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../Hive/Hive.dart';
import '../../../Model/LoginPageModel.dart';
import '../../../Network/DataLoaderBlock.dart';
import '../../../Network/WebParam.dart';
import '../../../Network/WebUrl.dart';
import '../../../home_page/ui/widget/menu_widget.dart';
import '../../../settings/ui/settings.dart';
import '../../../utils/effect/custom_page_route.dart';
import '../../../utils/style/colors.dart';
import '../../../home_page/ui/screens/main_screen.dart';
import '../../../otp/ui/screen/otp.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _formKey = GlobalKey<FormState>();
  ///hive
  late Box<String> saveToken;
  final email = TextEditingController();
  final password = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  AuthPrefsHelper authPrefsHelper = AuthPrefsHelper();
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: BlocProvider(
        create: (BuildContext context) => DataLoaderBloc(Default()),
        child: SingleChildScrollView(
          child:Column(children: [
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
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02),
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const PinCodeVerificationScreen(phoneNumber: "",)));
                                      },
                                    )),
                              ),
                              BlocConsumer<DataLoaderBloc, GlobalState>(
                                  listener: (context, state) {
                                    if (state is Error) {
                                      Fluttertoast.showToast(msg: state.errorMessage);
                                    }
                                    else if (state is ConnectionError) {
                                      MotionToast.error(
                                          title: Text("Hookah",
                                              style:  TextStyle(fontWeight: FontWeight.bold),),
                                          description: Text("Connection error")
                                        //  animationType: ANIMATION.FROM_LEFT,
                                      )
                                          .show(context);
                                    }
                                    else if (state is Successfully) {
                                      print(state.data);
                                      print("christiannnnnnnnnn:  helloooooo");
                                      // var login = logInModel.fromJson(state.data);
                                      print('-------------------------------------------');
                                      // AuthPrefsHelper().setToken(login.token ?? '');

                                      //store token inside sharedPref
                                      //  login.gettoken;
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                    return MainScreen();
                                  },),);}
                                    },
                                  builder: (context, state) {
                                    if (state is Default) {
                                      print("default");
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: mediaQueryHeight * 0.03,
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (password.text.isEmpty ||
                                                email.text.isEmpty ||
                                                password.text.length < 6) {
                                              _formKey.currentState!.validate();
                                            }
                                             else {
                                         BlocProvider.of<DataLoaderBloc>(context).add(
                                             FetchData(
                                               Urls.LOGIN,
                                               body: WebParam.LoginParams(
                                                   email.text,
                                                   password.text,
                                               ),
                                                 requestType: RequestType.post));

                                             }
                                        // Navigator.pushReplacement(context,
                                        //     MaterialPageRoute(
                                        //   builder: (context) {
                                        //     return const PinCodeVerificationScreen();
                                        //   },
                                        // ));
                                      },
                                      child: Center(
                                        child: Text('LOGIN',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto-Bold'),
                                            textAlign: TextAlign.left),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        // padding: EdgeInsets.symmetric(
                                        //     horizontal: mediaQueryWidth * 0.23,
                                        //     vertical: mediaQueryHeight * 0.018),
                                        primary: YellowColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                    else if (state is Loading)
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: mediaQueryHeight * 0.03,
                                        ),
                                        child: Container(
                                          width: 120,
                                          child: MaterialButton(
                                            onPressed: () {},
                                            child: LoadingAnimationWidget.twistingDots(leftDotColor: Colors.black, rightDotColor: Colors.yellow, size: 42)
                                            // style: ElevatedButton.styleFrom(
                                            //   padding: EdgeInsets.symmetric(
                                            //       horizontal: mediaQueryWidth * 0.23,
                                            //       vertical: mediaQueryHeight * 0.018),
                                            //   primary: YellowColor,
                                            //   shape: RoundedRectangleBorder(
                                            //     borderRadius:
                                            //     BorderRadius.circular(10.0),
                                            //   ),
                                            // ),
                                          ),
                                        ),
                                      );
                                    else {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: mediaQueryHeight * 0.03,
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (password.text.isEmpty ||
                                                email.text.isEmpty ||
                                                password.text.length < 6) {
                                              _formKey.currentState!.validate();
                                            }
                                            // Fluttertoast.showToast(
                                            //     msg: getTranslate(context, 'fillField'),
                                            //     toastLength: Toast.LENGTH_SHORT,
                                            //     gravity: ToastGravity.BOTTOM,
                                            //     timeInSecForIosWeb: 1);
                                            else {
                                              BlocProvider.of<DataLoaderBloc>(context).add(
                                                  FetchData(Urls.LOGIN,
                                                      body: WebParam.LoginParams(
                                                          email.text, password.text,),
                                                      requestType: RequestType.post));
                                            }
                                          },
                                      child: const Text(
                                        'Log In',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Roboto-Bold'),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                mediaQueryWidth * 0.35,
                                            vertical:
                                                mediaQueryHeight * 0.025),
                                        primary: YellowColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
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
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            CustomPageRoute(
                                                child: SignupScreen()));
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
            ),
          ]),
        ]),)
      ),
    );
  }
}
