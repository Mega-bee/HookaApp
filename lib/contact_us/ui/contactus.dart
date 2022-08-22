import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooka/contact_us/request/contactus_request.dart';
import 'package:hooka/contact_us/state_manager/contactus_state_manager.dart';
import 'package:hooka/utils/images/images.dart';
import 'package:injectable/injectable.dart';
import '../../../../utils/style/colors.dart';
import '../../../../utils/components/custom_alert.dart';
import 'package:hooka/home_page/ui/widget/menu_widget.dart';

@injectable
class ScreenContactus extends StatefulWidget {
 final ContactUsCubit cubit;
 ScreenContactus(this.cubit,);

  @override
  State<ScreenContactus> createState() => ScreenContactusState();
}

class ScreenContactusState extends State<ScreenContactus> {

  final name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Mobile = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();
  ContactUssss(ContactUsRequest request){
    widget.cubit.ContactUs(this,request);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: MenuWidget(),
        backgroundColor: Colors.white,
        title: Text("ContactUs",style: TextStyle(color: Colors.black),),

      ),
      body: SingleChildScrollView(

        child: Column(children: [
          SizedBox(height: mediaQueryHeight*0.02,),

          Align(
            alignment: Alignment.center,
            child: Card(
elevation: 0,borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 3),
                  borderRadius: BorderRadius.circular(150),
                ),


              child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                Image.asset(ImageAsset.LOGO,height: 170,width: 170,fit: BoxFit.fill,)])
            ),),
          SizedBox(height: mediaQueryHeight*0.02,),
          Padding(
            padding: const EdgeInsets.only(right: 105.0),
            child: Text("We are committed to your Experience ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
          SizedBox(height: mediaQueryHeight*0.02,),
Padding(
  padding: const EdgeInsets.only(right: 90.0),    child: Text('Recognizing the value of memorable\n'
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
        'for further information about our brand.\n',style: TextStyle(
    fontSize: 14,
    color: Colors.grey[600]),
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
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQueryWidth * 0.05),
                  child: TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 12),
                      controller:name,
                      decoration: InputDecoration(

                        filled: true,
                        fillColor: Colors.white,
                        labelText:"Name",
                        hintText: " Name",
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
                      style: const TextStyle(fontSize: 12),
                      controller:Mobile,
                      decoration: InputDecoration(

                        filled: true,
                        fillColor: Colors.white,
                        labelText:"Mobile",
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
                  child:
                  TextFormField(
                      cursorColor: YellowColor,
                      style: const TextStyle(fontSize: 12),
                      controller:email,
                      decoration: InputDecoration(

                        filled: true,
                        fillColor: Colors.white,
                        labelText:" Email",
                        hintText: " Email",
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
                      style: const TextStyle(fontSize: 12),
                      controller:message,
                      decoration: InputDecoration(

                        filled: true,
                        fillColor: Colors.white,
                        labelText:"Your Message...",
                        hintText: " Name",
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

                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress),
                ),

              ],
            ),
          ),


          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomLogOutDialog(
                  title: "Are You Sure To Submit Your Message",

                  content: "",
                  yesBtn:() {
                    ContactUssss(ContactUsRequest(Mobile:Mobile.text, Email: email.text, Message: message.text, Name: name.text));
                    Fluttertoast.showToast(msg: "Your message has been sent");

                    Navigator.pop(context);
                    message.clear();
                    name.clear();
                    Mobile.clear();
                    email.clear();
                  },
                  noBtn: () {
                    Navigator.pop(context);
                  },
                ),
              );

            },
//                             } Navigator.of(context).pushReplacement(MaterialPageRoute(
//                                  builder: (context) =>  Navigationbar()));

            child:  Text(
              'SEND',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
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
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          ],),
      )
    );
  }
}
