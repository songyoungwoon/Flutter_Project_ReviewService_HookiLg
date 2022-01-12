import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/components/text_field_container.dart';

import '../constants.dart';


class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.grey,fontFamily: 'EliceDigitalBaeum'),
          icon: Icon(
            Icons.lock,
            color: Colors.amber[500],
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.indigo[100],
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
