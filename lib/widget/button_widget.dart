import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final bool isBold;
  
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.isBold,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.pinkAccent[400],
          //shape: StadiumBorder(),
          onPrimary: Colors.indigo[200],
          primary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3)
        ),
        child: Text(text, style: TextStyle(fontWeight: isBold? FontWeight.bold:FontWeight.normal, fontFamily: 'EliceDigitalBaeum'),),
        onPressed: onClicked,
      );
}
