import 'package:flutter/material.dart';

class wirteText extends StatefulWidget {
  wirteText({Key? key}) : super(key: key);
  @override
  _wirteTextState createState() => _wirteTextState();
}
final TextEditingController _contentEditingController = TextEditingController();
String content='';
class _wirteTextState extends State<wirteText>{
  @override
  Widget build(BuildContext context) {
    return Container(
    height: 300,
    child: TextField(
      controller: _contentEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0)
        )
      ),
      maxLines: 40,
      onChanged: (value){
        setState(() {
          content=value;
        });
      } 
    ),
  );
  }

}