import 'package:flutter/material.dart';

class wirteText extends StatefulWidget {
  int maxline=0;
  double fieldHeight=0;
  
  wirteText(this.maxline, this.fieldHeight);

  @override
  _wirteTextState createState() => _wirteTextState(maxline, fieldHeight);
}
final TextEditingController _contentEditingController = TextEditingController();
String content='';
class _wirteTextState extends State<wirteText>{
  int maxline=0;
  double fieldHeight=0;
  _wirteTextState(this.maxline,this.fieldHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
    height: fieldHeight,
    child: TextField(
      controller: _contentEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0)
        )
      ),
      maxLines: maxline,
      onChanged: (value){
        setState(() {
          content=value;
        });
      } 
    ),
  );
  }

}