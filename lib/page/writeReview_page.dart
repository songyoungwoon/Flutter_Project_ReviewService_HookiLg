import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart' as fq;
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
  fq.QuillController _controller = fq.QuillController.basic();

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
            color: Color(0xFFF06292)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
         
        backgroundColor: Colors.white,
        shadowColor: Colors.pink[200],
        ),
      body:Container(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
          child: Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleSection(),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.create,color: Colors.amber[600], size: 30,),
                        SizedBox(width: 10,),
                        Text("내용",
                        style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold
                        )),
                        // Expanded(child: SizedBox()),
                        
                      ],
                    ),
                    SizedBox(height: 10),

                    fq.QuillToolbar.basic(controller: _controller),
                    Expanded(
                      child: Container(
                        child: fq.QuillEditor.basic(
                          controller: _controller,
                          readOnly: false, // true for view only mode
                        ),
                      ),
                    )

                    //wirteText(50,350,300,'writeReview'),
                  ],
                )
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                          //d add Image 
                        }, icon: Icon(Icons.image, color: Colors.pink[300],size: 30,)),
                    Expanded(child: SizedBox()),
                    ElevatedButton(
                      onPressed: (){
                       createdata(movie_title, movie_director, title_text, content_text);
                       Navigator.pop(context);
                      },
                      child: Text("저장",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink[300]
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
            Icon(Icons.title,color: Colors.amber[600],size: 30,),
            SizedBox(width:10),
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
