import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'reviewList_page.dart';
import '../main.dart';
import '../widget/writeText.dart';


class writeReview extends StatefulWidget {
  String movie_title = '';
  String movie_director = '';

  writeReview(this.movie_title, this.movie_director);

  @override
  _writeReviewState createState() => _writeReviewState(movie_title, movie_director);
}

String title_text ='';
String content_text='';

class _writeReviewState extends State<writeReview>{
  String movie_title = '';
  String movie_director = '';

  _writeReviewState(this.movie_title, this.movie_director);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Write Review",
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
            color: Colors.pinkAccent),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Center(
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.pinkAccent),
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
                    Row(
                      children: [
                        Icon(Icons.create,color: Colors.amber[600]),
                        SizedBox(width: 5,),
                        Text("내용",
                        style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold
                        )),
                      ],
                    ),
                    SizedBox(height: 10),
                    wirteText(50,300,'writeReview'),
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
                       createdata(movie_title, movie_director, title_text, content_text);
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.title,color: Colors.amber[600],),
            SizedBox(width:5),
            Text("제목",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      
        Center(
          child: Container(
            width: 320,
            child: TextField(
              style: TextStyle(
                fontSize: 18,
                ),
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              onChanged: (value){
                title_text=value;
              },
            ),
          ),
        )
      ],
    ),
  );
}

void createdata(String movie_title, String movie_director, String title_text, String content_text) {
  final usercol = FirebaseFirestore.instance.collection("review").doc();
  usercol.set({
    "movie_title": "$movie_title",
    "director": "$movie_director",
    "title": "$title_text",
    "content": "$content_text",
  });
}
