import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:hooka/auth/ui/widget/custem_button.dart';
import 'package:hooka/contact_us/request/contactus_request.dart';
import 'package:hooka/contact_us/ui/screen/contactus.dart';
import 'package:hooka/utils/components/custom_alert.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:hooka/utils/style/colors.dart';

class ContactUsInitState extends States {
  final ScreenContactusState _screenContactusState;

  ContactUsInitState(this._screenContactusState);

  final name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Mobile = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: mediaQueryHeight * 0.02,
          ),
          Align(
            alignment: Alignment.center,
            child: Card(
                elevation: 0,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 3),
                  borderRadius: BorderRadius.circular(150),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAsset.LOGO,
                        height: 170,
                        width: 170,
                        fit: BoxFit.fill,
                      )
                    ])),
          ),
          SizedBox(
            height: mediaQueryHeight * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 105.0),
            child: Text(
              "We are committed to your Experience ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: mediaQueryHeight * 0.02,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Text(
              'Recognizing the value of memorable\n'
              'experiences, we are deeply committed\n'
              'to delivering consistent and reliable \n'
              'service across our business to guarantee\n'
              'the highest level of satisfaction. Our\n'
              'talented team understands the needs and\n'
              'expectations of hosts and customers, and\n'
              'we take immense pride in the quality of the\n'
              'products we use.\n'
              '\n'
              'Whether you are interested in becoming\n'
              'a host or learning more about the\n'
              'experience, we’d love to hear from you.\n'
              '\n'
              'Please send an email to info@hookatimes.com \n'
              'for further information about our brand.\n',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.05),
                  child: TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 12),
                      controller: name,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Name",
                        hintText: " Name",
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 0, color: Colors.black12)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.05),
                  child: TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 12),
                      controller: Mobile,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Mobile",
                        hintText: " Mobile",
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 0, color: Colors.black12)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.05),
                  child: TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 12),
                      controller: email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: " Email",
                        hintText: " Email",
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 0, color: Colors.black12)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.05),
                  child: TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 12),
                      controller: message,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Your Message...",
                        hintText: " Name",
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 0, color: Colors.black12)),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              buttonTab: () {
                _screenContactusState.ContactUssss(ContactUsRequest(
                    Mobile: Mobile.text,
                    Email: email.text,
                    Message: message.text,
                    Name: name.text));
              },
              loading: _screenContactusState.loadingSnapshot.connectionState ==
                  ConnectionState.waiting,
              text: 'Send',
              bgColor: YellowColor,
              textColor: Colors.black,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
        ],
      ),
    );
  }
}
