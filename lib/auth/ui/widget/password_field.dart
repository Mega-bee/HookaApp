import 'package:flutter/material.dart';

import '../../../Helpers/colors.dart';

class PasswordField extends StatefulWidget {

  TextEditingController password;

  PasswordField({required this.password});

  @override

  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  String validatePass(value) {
    if (value.isEmpty) {
      return 'Required *';
    }
    return "";
  }
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      cursorColor: YellowColor,
      style: const TextStyle(fontSize: 18),
      obscureText: _isObscure,
      controller: widget.password,
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
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure
                ? Icons.visibility
                : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(10.0),

        ),
      ),
      validator: validatePass,
    );
  }
}

