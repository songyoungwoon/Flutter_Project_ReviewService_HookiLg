import 'package:flutter/material.dart';

import '../widget/writeText.dart';

class showReview extends StatefulWidget {
  String review_title = '';
  String review_contents = '';

  showReview(this.review_title, this.review_contents);

  @override
  _showReviewState createState() =>
      _showReviewState(review_title, review_contents);
}

String replyString = '';

class _showReviewState extends State<showReview> {
  String review_title = '';
  String review_contents = '';

  List<String> dropdownList = ['modify', 'delete'];
  String selectedValue = 'modify';

  _showReviewState(this.review_title, this.review_contents);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Review",
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 25,
                ),
          ),
          leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios,
            color: Color(0xFFF06292),),

            onPressed: () {
              Navigator.pop(context);
            },
          ),
         
       backgroundColor: Colors.white,
       shadowColor: Colors.pink[200],
        ),
     body:
     SingleChildScrollView(

     child: Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:30, horizontal: 30),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              Icon(Icons.turned_in_outlined, color: Colors.amber[600],size: 30,),
              SizedBox(width: 5),
              Text(review_title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )),
              Expanded(child: SizedBox(height: 10),),

              IconButton(onPressed: (){
                    // 수정
              }, icon: Icon(Icons.upgrade,color: Colors.pink[300],)),
              IconButton(onPressed: (){
                    //삭제
              }, icon: Icon(Icons.delete,color: Colors.pink[300],))



            ]),
            SizedBox(height: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(review_contents,
                    style: TextStyle(fontSize: 15 )
                    ),)
                ),

            ]),
            SizedBox(height: 5),
            Divider(color: Colors.amber[600],thickness: 2,),
            
            SizedBox(height: 10),


            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 5,),
                wirteText(2,295,60,'writeReply'),
                IconButton(onPressed: (){

                }, icon:Icon(Icons.chat_bubble, color: Colors.pink[300],))
              ],
            )
            


          ]),
        ))));
  }
}
