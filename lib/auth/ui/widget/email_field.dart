import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../Helpers/colors.dart';

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
        style: const TextStyle(fontSize: 18),
        controller: widget.email,
        decoration: InputDecoration(

          filled: true,
          fillColor: Colors.white,
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
        validator: MultiValidator([
          RequiredValidator(errorText: 'Email Required *'),
          EmailValidator(errorText: 'Not a valid email'),
        ]),
        autovalidateMode:
        AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress);

  }
}
