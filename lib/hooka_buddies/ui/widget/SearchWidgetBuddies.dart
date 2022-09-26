import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/style/colors.dart';

class SearchWidgetBuddies extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  final Function onFilterPress;

  const SearchWidgetBuddies({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,required this.onFilterPress
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}
class _SearchWidgetState extends State<SearchWidgetBuddies> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = GoogleFonts.arsenal(fontWeight: FontWeight.w500,color: Colors.black);
    final style = widget.text.isEmpty ? styleHint : styleActive;
    return TextField(
      controller: controller,
      autofocus: false,
      style: style,
      onChanged:widget.onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical:
            MediaQuery
                .of(context)
                .size
                .height * 0.01),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey,width: 0),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme
                    .of(context)
                    .primaryColor)),
        filled: true,
        fillColor: Colors.grey[100],
        focusColor: const Color.fromRGBO(18, 108, 242, 1),
        hintText: widget.hintText,
        suffixIcon:
        controller.text.isNotEmpty
            ? GestureDetector(
          child: Icon(CupertinoIcons.xmark,size: 15, color: style.color),
          onTap: () {
            controller.clear();
            widget.onChanged('');
            FocusScope.of(context).requestFocus(FocusNode());
          },
        )
            :
       Text(""),
        prefixIcon:  Icon(
          CupertinoIcons.search,color: Colors.grey,
        ),
        prefixIconColor: const Color.fromRGBO(157, 157, 157, 1),
        hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontFamily: 'Roboto-Regular'),
      ),
    );
  }
}
