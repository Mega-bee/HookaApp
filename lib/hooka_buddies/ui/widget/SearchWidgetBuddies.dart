import 'package:flutter/material.dart';

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
    final styleHint = TextStyle(color: Colors.black54);
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
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(50)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme
                    .of(context)
                    .primaryColor)),
        filled: true,
        fillColor: Colors.white,
        focusColor: const Color.fromRGBO(18, 108, 242, 1),
        hintText: widget.hintText,
        suffixIcon: widget.text.isNotEmpty
            ? GestureDetector(
          child: Icon(Icons.close, color: style.color),
          onTap: () {
            controller.clear();
            widget.onChanged('');
            FocusScope.of(context).requestFocus(FocusNode());
          },
        )
            :  IconButton(
            icon: Icon(
              Icons.filter_alt_rounded,
              color: YellowColor,
            ),
            onPressed: () {
              widget.onFilterPress();
            }
      ),
        prefixIcon: const Icon(
          Icons.search_rounded,
        ),
        prefixIconColor: const Color.fromRGBO(157, 157, 157, 1),
        hintStyle: const TextStyle(
            color: Color.fromRGBO(157, 157, 157, 1),
            fontSize: 15,
            fontFamily: 'Roboto-Regular'),
      ),
    );
  }
}
