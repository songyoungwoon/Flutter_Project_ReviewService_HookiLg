import 'package:flutter/material.dart';

class wirteText extends StatefulWidget {
  int _maxline=0;
  double _textHeight=0;

  wirteText(this._maxline,this._textHeight);
  @override
  _wirteTextState createState() => _wirteTextState(_maxline, _textHeight);
}
final TextEditingController _contentEditingController = TextEditingController();

String content='';

class _wirteTextState extends State<wirteText>{
  int maxline=0;
  double textHeight=0;
  _wirteTextState(this.maxline,this.textHeight);
  
  @override
  Widget build(BuildContext context) {
    return Container(
    height: textHeight,
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