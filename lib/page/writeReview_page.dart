import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'reviewList_page.dart';
import '../main.dart';
import '../widget/writeText.dart';


class writeReview extends StatefulWidget {
  writeReview({Key? key}) : super(key: key);
  @override
  _writeReviewState createState() => _writeReviewState();
}

String title_text ='';
String content_text='';

class _writeReviewState extends State<writeReview>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("후기 작성"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Center(
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
            ),
          ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        shadowColor: Colors.white24,
        ),
      body:Container(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleSection(),
                    SizedBox(height: 15),
                    Text("내용",
                    style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold
                    )),
                    SizedBox(height: 10),
                    wirteText(40,250,'writeReview'),
                  ],
                )
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Expanded(child: SizedBox(height: 20)),
                    ElevatedButton.icon(
                      onPressed: (){
                      // BuildContext context;
                       createdata(title_text, content_text);
                       Navigator.pop(context);
                      },
                      icon: Icon(Icons.add,size:15),
                      label: Text("저장",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink[200]
                      ),
                    )
                  ]
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}
// 제목 입력칸
final TextEditingController _titleEditingController = TextEditingController();

Widget titleSection(){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("제목",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // color: Colors.pinkAccent
          ),
        ),

        TextField(
          style: TextStyle(
            fontSize: 18,
            ),
          decoration: InputDecoration(
            hintText: 'Title',
          ),
          onChanged: (value){
            title_text=value;
          },
        )
      ],
    ),
  );
}

void createdata(String title_text, String content_text) {
  final usercol = FirebaseFirestore.instance.collection("review").doc();
  usercol.set({
    "title": "$title_text",
    "content": "$content_text",
  });
}
