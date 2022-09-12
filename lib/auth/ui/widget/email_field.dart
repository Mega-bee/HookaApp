import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/style/colors.dart';

class EmailField extends StatefulWidget {

  TextEditingController email;

  EmailField({required this.email});

  @override
  State<EmailField> createState() => _EmailFieldState();

}
class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: YellowColor,
        style: const TextStyle(fontSize: 14),
        controller: widget.email,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:Colors.black)),


          hoverColor: Colors.black,
          focusColor: Colors.black,

          filled: true,
          fillColor: Colors.white,
          hintText: " Email",
          labelText: "Email",
          labelStyle:GoogleFonts.alef(color: Colors.black),
          enabledBorder: const OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  width: 0, color: Colors.black12)),
          border: OutlineInputBorder(


            borderSide:
            const BorderSide(color: Colors.grey,

            ),

            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: MultiValidator([
          RequiredValidator(errorText: 'Email Required *'),
          EmailValidator(errorText: 'Not a valid email'),
        ]),
        autovalidateMode:
        AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress);

  }
}
