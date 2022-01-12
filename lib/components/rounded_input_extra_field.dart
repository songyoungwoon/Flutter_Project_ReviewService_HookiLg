import 'package:flutter/material.dart';
import 'package:fp_review_service_hookilg/components/text_field_container.dart';

import '../constants.dart';

class RoundedInputExtraField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputExtraField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.icon = Icons.account_box,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.amber[600],
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey,fontFamily: 'EliceDigitalBaeum'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
