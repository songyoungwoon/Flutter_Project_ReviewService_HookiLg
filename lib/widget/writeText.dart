import 'package:flutter/material.dart';
import '../page/writeReview_page.dart';
import '../page/showReview_page.dart';

class wirteText extends StatefulWidget {
  int maxline=0;
  double fieldHeight=0;
  String returnPage ='';
  
  wirteText(this.maxline, this.fieldHeight, this.returnPage);

  @override
  _wirteTextState createState() => _wirteTextState(maxline, fieldHeight, returnPage);
}
class _wirteTextState extends State<wirteText>{
  final TextEditingController _contentEditingController = TextEditingController();
  // String content='';
  int maxline=0;
  double fieldHeight=0;
  String _returnPage ='';
  _wirteTextState(this.maxline,this.fieldHeight,this._returnPage);

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
          switch(_returnPage){
            case 'writeReview':
              content_text=value;
              break;
            case 'writeReply':
              replyString=value;
              break;


          

          }
        });
      } 
    ),
  );
  }

}