import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Container(color: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Card(
                color: Colors.white,
                  elevation: 0,
                  borderOnForeground: true,
                  // shape: RoundedRectangleBorder(
                  //   side: BorderSide(color: Colors.white70, width: 3),
                  //   borderRadius: BorderRadius.circular(150),
                  // ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageAsset.LOGO,
                          height: 220,
                          width: 300,
                          fit: BoxFit.cover,
                        )
                      ])),
            ),
          ),
          SizedBox(
            height: mediaQueryHeight * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "We are committed to your Experience ",
              style: GoogleFonts.anekLatin(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: mediaQueryHeight * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Recognizing the value of memorable experiences, \n'
              'we are deeply committed to delivering  consistent \n'

              'and reliable service across our business to guarantee\n'
              'the highest level of satisfaction. Our talented team\n'
              'understands the needs and expectations of hosts  and \n'

              'customers, and we take immense pride in the quality of \n'
              'the products we use.\n'
              '\n'
              'Whether you are interested in becoming a host\n'
              'or learning more about the experience,\n'
              'we’d love to hear from you. \n'
              '\n'

              'Please send an email to info@hookatimes.com \n'
              'for further information about our brand.\n',
              style: GoogleFonts.alef(fontSize: 17, color: Colors.grey[600]),
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
                        hintStyle: GoogleFonts.anekLatin(),
                        labelStyle: GoogleFonts.anekLatin(),
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
                        hintStyle: GoogleFonts.anekLatin(),
                        labelStyle: GoogleFonts.anekLatin(),
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
                        hintStyle: GoogleFonts.anekLatin(),
                        labelStyle: GoogleFonts.anekLatin(),
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
                        hintStyle: GoogleFonts.anekLatin(),
                        labelStyle: GoogleFonts.anekLatin(),
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
            padding: const EdgeInsets.all(28.0),
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
